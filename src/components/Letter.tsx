import Link from "next/link";
import styles from "../../src/styles/LetterBox.module.css";
type LetterProps = {
    letter : string
}

export default function Letter(props : LetterProps) {

    return (
        <>
                <div className={styles.letterBG}>
        <Link href={"/letters/"+props.letter.toLowerCase()}>
            <a className={styles.letterBox}>

                {props.letter}
            </a>
        </Link>
                </div>

        </>
    )
}