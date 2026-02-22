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
    name: "Project Emerge",
    description: "Low-cost, open-source swarm robotics platform with microservices architecture and MQTT middleware for experimenting with cooperative robots.",
    href: "https://github.com/Project-Emerge",
    linkTitle: `View on GitHub`,
    languages: ["rust", "scala", "python", "react"],
  },
  {
    name: "Rover Firmware",
    description: "Bare-metal Embedded Rust firmware for ESP32 microcontroller with modular, event-driven architecture using embassy-rs async runtime.",
    href: "https://github.com/Project-Emerge/rover-firmware",
    linkTitle: `View on GitHub`,
    languages: ["rust"],
  },
  {
    name: "Yaair",
    description: "A no_std-compatible Rust DSL optimized for resource-constrained embedded devices, enabling distributed computing on edge devices.",
    href: "https://github.com/nicolasfara/yaair",
    linkTitle: `View on GitHub`,
    languages: ["rust"],
  },
  {
    name: "ScaFi 3",
    description: "Scala 3 re-implementation of the ScaFi framework with an effect-based DSL for engineering distributed IoT systems with safety guarantees.",
    href: "https://github.com/scafi/scafi3",
    linkTitle: `View on GitHub`,
    languages: ["scala"],
  },
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
