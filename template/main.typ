#import "@preview/exp-cover-letter:0.1.0": *

// Same person and contact fields as the exp-resume John Doe starter.
#let name = "John Doe"
#let location = "Null Island, AT"
#let email = "john.doe@example.com"
#let email-text = "john.doe[at]email.com"
#let github = "github.com/johndoe"
#let github-text = "gh/johndoe"
#let linkedin = "linkedin.com/in/johndoe"
#let linkedin-text = "in/johndoe"
#let phone = "+1 (555) 010-0101"
#let personal-site = "johndoe.dev"
#let personal-site-text = "johndoe.dev"

#show: letter.with(
  author: name,
  location: location,
  email: email,
  email-text: email-text,
  github: github,
  github-text: github-text,
  linkedin: linkedin,
  linkedin-text: linkedin-text,
  phone: phone,
  personal-site: personal-site,
  personal-site-text: personal-site-text,
  accent-color: "#000000",
  font: "New Computer Modern",
  paper: "us-letter",
  author-position: center,
  personal-info-position: center,
  date: "October 26, 2026",
  recipient-name: "Ada Lovelace",
  recipient-title: "Hiring Manager",
  company: "Example Corporation",
  company-address: "1 Compiler Way, Byteburg, CA",
  subject: "Re: Software Engineer",
  greeting: "Dear Ada Lovelace,",
  closing: "Sincerely,",
)

/*
 * Keep the letter to one page. Three paragraphs, not a second resume.
 * 1. Name the role and one specific reason for this employer.
 * 2. One or two results, told as stories. Do not paste resume bullets.
 * 3. Ask for a conversation and thank the reader.
 * Empty recipient fields are omitted. Drop date, subject, greeting, or
 * closing by setting them to "".
 */

The Software Engineer opening is the first posting I have seen that calls a failed deploy a product bug. That is the job I want, on the team that already writes about releases that way.

The resume lists a 12-step release that became one command, and runbooks that made on-call quieter. The part that matters here is the habit under those lines. At Stack Overflow Overflow I sat with the person who ran the old checklist and deleted a step only after a release still worked. At Infinite Loop the runbooks were written for someone who had never seen the repo. I can bring that habit to a queue that already treats failure as a bug.

I am free for a conversation this month. Thank you for reading the application.
