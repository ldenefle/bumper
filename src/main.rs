use git2::{Repository, Error};
use semver::{Version, SemVerError};
use std::cmp::Ordering;
use regex::Regex;

#[derive(PartialEq)]
#[derive(Debug)]
enum BumpType {
    Major,
    Minor,
    Patch
}

fn main() {
    let repo = Repository::open(".").unwrap();
    let last_tag = match get_version_from_tag(&repo) {
        Ok(version) => version,
        Err(e) => {
            panic!("error : {}", e);
        }
    };

    let mut current_version = validate_tag(&last_tag).unwrap();
    println!("Current version is {}", current_version);

    match get_bump_type(&repo, &last_tag) {
        Ok(BumpType::Major) => current_version.increment_major(),
        Ok(BumpType::Minor) => current_version.increment_minor(),
        Ok(BumpType::Patch) => current_version.increment_patch(),
        Err(e) => panic!("error: {}", e),
    };

    println!("Next version is {}", current_version);
}

fn get_bump_type(repo: &Repository, tag: &str) -> Result<BumpType, Error> {
    let mut bump = BumpType::Patch;
    let mut revwalk = repo.revwalk()?;
    revwalk.push_range(format!("{}..HEAD", &tag).as_str())?;
    revwalk.set_sorting(git2::Sort::TOPOLOGICAL);
    for rev in revwalk {
        let commit = repo.find_commit(rev?)?;
        let message = commit.summary_bytes().unwrap_or_else(|| commit.message_bytes());
        let message = String::from_utf8_lossy(message);
        println!("Parsing {}", message);
        if message.contains("BREAKING CHANGE") {
            bump = BumpType::Major;
            break
        }
        let re = Regex::new(r"(\w+)(?:\(([^\)\s]+)\))?:(.+)(?:$)").unwrap();
        let commit_type = match re.captures(&message) {
            Some(caps) => caps.get(1).map_or(tag, |m| m.as_str()),
            None => continue
        };

        println!("Commit type {}", commit_type);
        let commit_bump = match commit_type {
            "feat" => BumpType::Minor,
            "fix" => BumpType::Patch,
            _ => BumpType::Patch,
        };

        if bump == BumpType::Patch && commit_bump == BumpType::Minor {
            bump = BumpType::Minor
        }

    }
    println!("Bumping with {:?}", bump);
    Ok(bump)
}

fn validate_tag(tag: &str) -> Result<semver::Version, SemVerError> {
    let re = Regex::new(r"v(.*)").unwrap();
    let tag = match re.captures(tag) {
        Some(caps) => caps.get(1).map_or(tag, |m| m.as_str()),
        None => tag,
    };
    println!("Validating tag {}", tag);
    Version::parse(tag)
}

fn get_version_from_tag(repo: &Repository) -> Result<String, Error> {
    let tags = repo.tag_names(Some("*"))?;
    // If no tags detected, return first tag
    if tags.is_empty() {
        Err(Error::from_str("No tags detected in repo"))
    }
    // If only one tag detected check if valid and returns
    else if tags.len() == 1 {
        Ok(String::from(tags.get(0).unwrap()))
    }
    // If multiple tags detected gets the most recent
    else {
        let max_tag = tags.iter().max_by(|x, y| {
            if let (Some(x), Some(y)) = (x, y) {
                println!("{} {}", x, y);
                let v1 = validate_tag(x).unwrap();
                let v2 = validate_tag(y).unwrap();
                return v1.cmp(&v2);
            }
            Ordering::Greater
        }).unwrap();

        println!("Older tag is {}", max_tag.unwrap());
        Ok(String::from(max_tag.unwrap()))
    }
}

