import type { Props } from "astro";
import IconMail from "@/assets/icons/IconMail.svg";
import IconGitHub from "@/assets/icons/IconGitHub.svg";
import IconBrandX from "@/assets/icons/IconBrandX.svg";
import IconLinkedin from "@/assets/icons/IconLinkedin.svg";
import IconWhatsapp from "@/assets/icons/IconWhatsapp.svg";
import IconFacebook from "@/assets/icons/IconFacebook.svg";
import IconTelegram from "@/assets/icons/IconTelegram.svg";
import IconPinterest from "@/assets/icons/IconPinterest.svg";
import { SITE } from "@/config";

interface Social {
  name: string;
  href: string;
  linkTitle: string;
  icon: (_props: Props) => Element;
}

interface Project {
  name: string;
  description: string;
  href: string;
  linkTitle: string;
  languages: string[];
}

export const PROJECTS: Project[] = [
  {
    name: "Personal Blog",
    description: "This very blog you're reading, built with Astro and Tailwind CSS.",
    href: "https://example.com/personal-blog",
    linkTitle: `View on GitHub`,
    languages: ["kotlin", "scala"],
  },
  {
    name: "Project Alpha",
    description: "A web app for managing tasks and projects efficiently.",
    href: "https://example.com/project-alpha",
    linkTitle: `View on GitHub`,
    languages: ["rust"],
  },
  {
    name: "Open Source Library",
    description: "A JavaScript library for simplifying API interactions.",
    href: "https://example.com/open-source-library",
    linkTitle: `View on GitHub`,
    languages: ["javascript"],
  },
  // {
  //   name: "Portfolio Website",
  //   description: "A portfolio showcasing my work and skills as a developer.",
  //   href: "https://example.com/portfolio-website",
  //   linkTitle: `View on GitHub`,
  // }
] as const;

export const SOCIALS: Social[] = [
  {
    name: "GitHub",
    href: "https://github.com/nicolasfara",
    linkTitle: `${SITE.title} on GitHub`,
    icon: IconGitHub,
  },
  // {
  //   name: "X",
  //   href: "https://x.com/username",
  //   linkTitle: `${SITE.title} on X`,
  //   icon: IconBrandX,
  // },
  {
    name: "LinkedIn",
    href: "https://www.linkedin.com/in/nfarabegoli/",
    linkTitle: `${SITE.title} on LinkedIn`,
    icon: IconLinkedin,
  },
  {
    name: "Mail",
    href: "mailto:nicolas.farabegoli@gmail.com",
    linkTitle: `Send an email to ${SITE.title}`,
    icon: IconMail,
  },
] as const;

export const SHARE_LINKS: Social[] = [
  {
    name: "WhatsApp",
    href: "https://wa.me/?text=",
    linkTitle: `Share this post via WhatsApp`,
    icon: IconWhatsapp,
  },
  {
    name: "Facebook",
    href: "https://www.facebook.com/sharer.php?u=",
    linkTitle: `Share this post on Facebook`,
    icon: IconFacebook,
  },
  {
    name: "X",
    href: "https://x.com/intent/post?url=",
    linkTitle: `Share this post on X`,
    icon: IconBrandX,
  },
  {
    name: "Telegram",
    href: "https://t.me/share/url?url=",
    linkTitle: `Share this post via Telegram`,
    icon: IconTelegram,
  },
  {
    name: "Pinterest",
    href: "https://pinterest.com/pin/create/button/?url=",
    linkTitle: `Share this post on Pinterest`,
    icon: IconPinterest,
  },
  {
    name: "Mail",
    href: "mailto:?subject=See%20this%20post&body=",
    linkTitle: `Share this post via email`,
    icon: IconMail,
  },
] as const;
