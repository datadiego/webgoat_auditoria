#!/bin/bash
rm informe.pdf
indice="0_indice"
intro="0_introduccion"
conclusiones="0_conclusiones"
information_gathering="information_gathering"
s1="1_inyeccion_sql"
s2="2_cross_site_scripting"
s3="3_security_misconfiguration"
s4="4_vuln_outdated_components"
s5="5_secure_passwords"
s6="6_IDOR"
s7="7_insecure_login"
s8="8_refs_anexos"

lista_capitulos="$indice $intro $conclusiones $information_gathering $s1 $s2 $s3 $s4 $s5 $s6 $s7 $s8"


margen="2cm"

for capitulo in $lista_capitulos; do
    echo "Creando PDF de $capitulo"
    #do not number sections
    pandoc $capitulo.md -o $capitulo.pdf --variable classoption=oneside --variable fontsize=12pt --variable linkcolor=blue --variable urlcolor=blue --variable geometry:margin=$margen --include-in-header config.tex
done

echo "Creando PDF de todo el informe"
pdftk portada.pdf $indice.pdf $intro.pdf $conclusiones.pdf $information_gathering.pdf $s1.pdf $s2.pdf $s3.pdf $s4.pdf $s5.pdf $s6.pdf $s7.pdf $s8.pdf cat output informe.pdf

rm $intro.pdf $indice.pdf $conclusiones.pdf $information_gathering.pdf $s1.pdf $s2.pdf $s3.pdf $s4.pdf $s5.pdf $s6.pdf $s7.pdf $s8.pdf
cat $intro.md $indice.md $conclusiones.md $information_gathering.md $s1.md $s2.md $s3.md $s4.md $s5.md $s6.md $s7.md > README.md
echo "Informe creado en informe.pdf"