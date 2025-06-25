import { QuartzComponent, QuartzComponentConstructor, QuartzComponentProps } from "./types"
import style from "./styles/footer.scss"


interface Options {}

export default ((opts?: Options) => {
  const Footer: QuartzComponent = ({ displayClass, cfg }: QuartzComponentProps) => {
   return (
      <footer class={`${displayClass ?? ""}`}>
        <p>
          © {new Date().getFullYear()} Rina Chen. Some rights reserved.
        </p>
        <p>
          Content licensed under{" "}
          <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank" rel="noopener noreferrer">
            CC BY-NC-SA 4.0
          </a>.
        </p>
      </footer>
    )
  }

  Footer.css = style
  return Footer
}) satisfies QuartzComponentConstructor
