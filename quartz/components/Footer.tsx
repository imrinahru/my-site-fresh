import { QuartzComponent, QuartzComponentConstructor, QuartzComponentProps } from "./types"
import style from "./styles/footer.scss"
import { version } from "../../package.json"
import { i18n } from "../i18n"
import siteConfig from "../../quartz.config"

interface Options {
  links?: Record<string, string>
}

export default ((opts?: Options) => {
  const Footer: QuartzComponent = ({ displayClass, cfg }: QuartzComponentProps) => {
    const year = new Date().getFullYear()
    const links = opts?.links ?? {}
    const footerConfig = siteConfig.configuration.footer

    return (
      <footer class={`${displayClass ?? ""}`}>
        <p>{footerConfig?.copyright ?? `© ${year} Rina Chen. Some rights reserved.`}</p>
        {footerConfig?.extra && (
          <p dangerouslySetInnerHTML={{ __html: footerConfig.extra }}></p>
        )}
        {Object.keys(links).length > 0 && (
          <ul>
            {Object.entries(links).map(([text, link]) => (
              <li>
                <a href={link}>{text}</a>
              </li>
            ))}
          </ul>
        )}
      </footer>
    )
  }

  Footer.css = style
  return Footer
}) satisfies QuartzComponentConstructor
