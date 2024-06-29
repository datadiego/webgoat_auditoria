#!/bin/bash
rm informe.pdf
indice="0_indice"
intro="0_introduccion"
information_gathering="information_gathering"
s1="1_inyeccion_sql"
s2="2_cross_site_scripting"
s3="3_security_misconfiguration"
s4="4_vuln_outdated_components"
s5="5_secure_passwords"
s6="6_IDOR"
s7="7_insecure_login"
lista_capitulos="$indice $intro $information_gathering $s1 $s2 $s3 $s4 $s5 $s6 $s7"


margen="2cm"

for capitulo in $lista_capitulos; do
    echo "Creando PDF de $capitulo"
    #do not number sections
    pandoc $capitulo.md -o $capitulo.pdf --variable classoption=oneside --variable fontsize=12pt --variable linkcolor=blue --variable urlcolor=blue --variable geometry:margin=$margen --include-in-header config.tex
done

echo "Creando PDF de todo el informe"
pdftk $indice.pdf $intro.pdf $information_gathering.pdf $s1.pdf $s2.pdf $s3.pdf $s4.pdf $s5.pdf $s6.pdf $s7.pdf cat output informe.pdf

rm $intro.pdf $indice.pdf $information_gathering.pdf $s1.pdf $s2.pdf $s3.pdf $s4.pdf $s5.pdf $s6.pdf $s7.pdf

echo "Informe creado en informe.pdf"