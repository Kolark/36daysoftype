import Link from "next/link";
import styles from "../styles/Overlay.module.css";

type OverlayProps = {
    previous:string,
    next:string
}

export default function Overlay(props:OverlayProps) {
    return (
        <div className={styles.overlay}>

        <div className={styles.links}>
            <div className={styles.links_container}>
            <div className={styles.letter}>
                <Link href={"/letters/"+props.previous}>
                <a><h1>{props.previous.toUpperCase()}</h1></a>
                </Link>
            </div>
            <div className={styles.letter}>
                <Link href={"/letters/"+props.next}>
                <a><h1>{props.next.toUpperCase()}</h1></a>
                </Link>
            </div>
            </div>
        </div>
        <div className={styles.return}>
        <Link href="/">
            <a><h2>return</h2></a>
        </Link>
        </div>

        </div>
    )
}