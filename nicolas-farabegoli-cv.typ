#import "@preview/modern-cv:0.9.0": *

// Custom function to display skills with expertise levels (0-5)
#let resume-skill-item-with-level(category, skills, accent-color: "#1a5490", bg-color: "#f8f9fa", border-color: "#e9ecef", empty-color: gray) = {
  let skill-display(skill-name, level) = {
    let dots-content = none
    
    // Create filled dots for the skill level
    for i in range(level) {
      let dot = text(fill: rgb(accent-color), "●")
      if dots-content == none {
        dots-content = dot
      } else {
        dots-content = [#dots-content#dot]
      }
    }
    
    // Create empty dots for remaining levels
    for i in range(5 - level) {
      let dot = text(fill: empty-color, "○")
      if dots-content == none {
        dots-content = dot
      } else {
        dots-content = [#dots-content#dot]
      }
    }
    
    // Return skill in a subtle box with non-breaking dots
    box(
      fill: rgb(bg-color),
      stroke: 0.5pt + rgb(border-color),
      radius: 3pt,
      inset: (x: 4pt, y: 2pt),
      width: auto,
      [#skill-name #h(0.4em) #box(dots-content)]
    )
  }

  // Build skills content with flow layout
  let skills-content = none
  for (i, skill) in skills.enumerate() {
    let current-skill = if type(skill) == "array" and skill.len() == 2 {
      skill-display(skill.at(0), skill.at(1))
    } else if skill.len() == 2 {
      // Handle tuples
      skill-display(skill.at(0), skill.at(1))
    } else {
      // Fallback for backward compatibility
      skill
    }
    
    if skills-content == none {
      skills-content = current-skill
    } else {
      skills-content = [#skills-content #h(0.6em) #current-skill]
    }
  }
  
  // Custom layout with category and aligned skills
  grid(
    columns: (140pt, 1fr),
    gutter: 1em,
    row-gutter: 0.3em,
    [*#category*],
    skills-content
  )
  block(below: 0.5em)
}

// Custom function to display regular skills with boxes (no levels)
#let resume-skill-item-boxed(category, skills, bg-color: "#f8f9fa", border-color: "#e9ecef") = {
  let skill-display(skill-name) = {
    // Return skill in a subtle box without dots
    box(
      fill: rgb(bg-color),
      stroke: 0.5pt + rgb(border-color),
      radius: 2pt,
      inset: (x: 4pt, y: 2pt),
      width: auto,
      skill-name
    )
  }

  // Build skills content with flow layout
  let skills-content = none
  for (i, skill) in skills.enumerate() {
    let current-skill = skill-display(skill)
    
    if skills-content == none {
      skills-content = current-skill
    } else {
      skills-content = [#skills-content #h(0.6em) #current-skill]
    }
  }
  
  // Custom layout with category and aligned skills
  grid(
    columns: (140pt, 1fr),
    gutter: 1em,
    row-gutter: 0.3em,
    [*#category*],
    skills-content
  )
  block(below: 0.5em)
}

#show: resume.with(
  author: (
    firstname: "Nicolas",
    lastname: "Farabegoli",
    email: "nicolas.farabegoli@gmail.com",
    homepage: "https://nicolasfarabegoli.it",
    phone: "(+39) 340-2876022",
    github: "nicolasfara",
    // scholar: "d3k7EVUAAAAJ",
    // orcid: "0000-0002-7321-358X",
    birth: "October 20, 1997",
    // linkedin: "nfarabegoli",
    address: "via Bagalona, 599 Bertinoro (FC)",
    positions: (
      "Software Engineer",
      "Researcher",
      "PhD Student",
    ),
  ),
  keywords: ("Engineer", "Researcher"),
  description: "Nicolas Farabegoli - CV",
  profile-picture: none,
  date: datetime.today().display(),
  language: "en",
  accent-color: "#1a5490",
  colored-headers: true,
  show-footer: false,
  show-address-icon: false,
  paper-size: "a4",
  font: "Source Sans Pro",
  header-font: "Roboto"
)

= Education

#resume-entry(
  title: "Ph.D. in Computer Science and Engineering",
  location: "Cesena, Italy",
  date: "Nov 2022 - Present",
  description: "Alma Mater Studiorum - University of Bologna",
)

#resume-item[
  - Research on Aggregate Computing, Deployment models for Cyber-Physical Systems, Edge-Cloud Continuum
  - Published and presented +10 papers in international conferences and journals
]

#resume-entry(
  title: "Master's Degree in Computer Science and Engineering",
  location: "Cesena, Italy",
  date: "Sep 2020 - Mar 2023",
  description: "Alma Mater Studiorum - University of Bologna",
)

#resume-item[
  - Final grade: _*110/110 cum laude*_
  - Thesis: "Design and Implementation of a Portable Framework for Application Decomposition and Deployments in the Cloud-Edge Systems"
]

#resume-entry(
  title: "Bachelor's Degree in Computer Science and Engineering",
  location: "Cesena, Italy",
  date: "Sep 2016 - Mar 2020",
  description: "Alma Mater Studiorum - University of Bologna",
)

#resume-item[
  // - Final grade: 103/110
  - Thesis: "An optimized implementation of the Dirac operator on GPGPU"
]

#resume-entry(
  title: "High School Diploma in Electronics and Automation",
  location: "Cesena, Italy",
  date: "Sep 2011 - Jul 2016",
  description: "Istituto Tecnico Tecnologico Statale B. Pascal",
)
#block(below: 0.65em)

= Experience

#resume-entry(
  title: "IT Consultant",
  location: "Bertinoro, Italy",
  date: "Mar 2021 - Present",
  description: "Caseificio Mambelli S.r.l.",
)

#resume-item[
  - Implemented Active Directory and Windows Server infrastructure for centralized user management
  - Migrated legacy file storage to a structured network-attached storage (NAS) solution
  - Configured automated backup systems, reducing data recovery time from days to hours
  - Advised on GDPR compliance and implemented basic cybersecurity measures (firewall rules, access policies)
]

#resume-entry(
  title: "Advanced Linux Course",
  location: "Rimini, Italy",
  date: "Nov 2024",
  description: "SCM Group",
)

#resume-item[
  - Taught advanced Linux aspects to company engineers
  - Covered topics such as _package managers_, _graphic servers & graphical environments_, _Yocto Project for embedded Linux systems_
]

#resume-entry(
  title: "Tutor",
  location: "Cesena, Italy",
  date: "2020 - Present",
  description: "Alma Mater Studiorum - University of Bologna",
)

#resume-item[
  - Teaching assistant for courses: _Object-Oriented Programming_, _Distributed Systems_, _Laboratory of Software Systems_
  - Supporting students with programming and software engineering concepts
]

#resume-entry(
  title: "Research Fellow",
  location: "Cesena, Italy",
  date: "Apr 2022 - Oct 2022",
  description: "Alma Mater Studiorum - University of Bologna",
)

#resume-item[
  - Continuation of Master's thesis research
  - Focus on application decomposition and deployment in edge-cloud environments finalizing the Pulvreakt framework
]

= Projects

#resume-entry(
  title: "Pulvreakt",
  location: [#github-link("pulvreakt/pulvreakt")],
  date: "2022 - Present",
  description: "Lead Developer",
)

#resume-item[
  - A Kotlin Multiplatform framework for pulverized systems
  - Enables deployment of aggregate computing applications across edge-cloud continuum
]

#resume-entry(
  title: "Collektive",
  location: github-link("Collektive/collektive"),
  date: "2023 - Present",
  description: "Lead Developer",
)

#resume-item[
  - Aggregate computing framework written in Kotlin multiplatform
  - Compiler plugin for managing aggregate programs
]

#resume-entry(
  title: "ScaFi 3",
  location: github-link("scafi/scafi3"),
  date: "2020 - Present",
  description: "Lead Developer",
)

#resume-item[
  - Scala 3 re-implementation of the ScaFi framework
  - Effect-based DSL for engineering collective adaptive systems
]

#resume-entry(
  title: "MkTT",
  location: github-link("nicolasfara/mktt"),
  date: "2024 - Present",
  description: "Creator and Maintainer",
)

#resume-item[
  - A Kotlin Multiplatform, asynchronous, flow-based MQTT client library
]

#resume-entry(
  title: "Project Emerge",
  location: github-link("Project-Emerge"),
  date: "2025 - Present",
  description: "Creator and Maintainer",
)

#resume-item[
  - Initiative to provide a low-cost, open-source swarm robotics platform
  - Designed and developed PCB, firmware, and software architecture
  - Focus on education and research in swarm robotics and collective systems
]

#resume-entry(
  title: [Rover Firmware --- Project Emerge],
  location: github-link("Project-Emerge/rover-firmware"),
  date: "2025 - Present",
  description: "Creator and Maintainer",
)

#resume-item[
  - Rust firmware for the Project Emerge rover robot
  - Features modular, event-driven architecture for easy extension and customization
]

#resume-entry(
  title: [Yaair],
  location: github-link("nicolasfara/yaair"),
  date: "2025 - Present",
  description: "Creator and Maintainer",
)

#resume-item[
  - Aggregate Computing DSL implementation in Rust
  - Designed to be fast, memory-safe, and suitable for embedded systems
]

#block(below: 0.65em)

= Tech Skills

#resume-skill-item-with-level(
  "Programming Languages",
  (
    ("C", 3),
    ("C++", 3),
    ("Bash", 3),
    ("Java", 4),
    ("JavaScript", 3),
    ("Kotlin", 5),
    ("Python", 3),
    ("Rust", 2),
    ("Scala", 5),
    ("TypeScript", 3),
  ),
  accent-color: "#1a5490"
)
#resume-skill-item-with-level(
  "Technologies & Tools",
  (
    ("Android", 4),
    ("Ansible", 3),
    ("Docker", 4),
    ("Embedded Rust", 3),
    ("Git", 5),
    ("GitHub Actions", 4),
    ("Gradle", 4),
    ("Kubernetes", 2),
    ("Linux", 4),
    ("MQTT", 4),
    ("Proxmox VE", 3),
    ("Sbt", 4),
    ("Yocto Project", 3),
  ),
  accent-color: "#1a5490"
)
#resume-skill-item-boxed(
  "Frameworks & Paradigms",
  (
    "Akka",
    "Arduino",
    "Cats",
    "Cats Effect",
    "FP",
    "Ktor",
    "OOP",
    "Raspberry Pi",
    "React",
    "Spark",
    "Spring Boot",
    "STM32 HAL",
  ),
)
#resume-skill-item-boxed(
  "Applications",
  (
    "FreeCAD",
    "Fusion 360",
    "IntelliJ IDEA",
    "Kicad",
    "Visual Studio Code",
  ),
)

#resume-skill-item("Spoken Languages", (strong("Italian (Native)"), "English (Fluent in writing and speaking)"),)

#block(below: 0.65em)

// Legend for skill level dots
#block(above: 0.5em, below: 0.5em)[
  #text(size: 0.9em, style: "italic")[
    //*Proficiency Legend:* 
    #text(fill: rgb("#1a5490"), "●") Novice (learning basics) #h(0.8em)
    #text(fill: rgb("#1a5490"), "●●") Competent (can work with guidance) #h(0.8em)
    #text(fill: rgb("#1a5490"), "●●●") Proficient (independent work) #h(0.8em)
    #text(fill: rgb("#1a5490"), "●●●●") Expert (can mentor others) #h(0.8em)
    #text(fill: rgb("#1a5490"), "●●●●●") Master (industry-level expertise)
  ]
]

#block(below: 1em)

= Hobbies

#resume-skill-item(
  "Tech",
  (
    "Open Source Contribution",
    "Robotics",
    "3D Printing",
    "PCB Design",
    "Electronics",
  ),
)

#resume-skill-item(
  "Outdoor Activities",
  (
    "Hiking",
    "MTB",
    "Tennis",
  ),
)
