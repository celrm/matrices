module Info exposing (informacion)

import Html exposing (Html)
import Html.Attributes exposing (style)
import Markdown

import Types exposing (..)
import Styles exposing (..)


informacion : Html Msg
informacion =
  Markdown.toHtml
    [ textStyle "20px"
    , style
        [ ("text-align", "justify")
        , ("width", "650px")
        , ("margin-left", "auto")
        , ("margin-right", "auto")
        ]
    ] texto


texto = """

  # Más información:

  ## ¿Qué es una _matriz dodecafónica_?

  Dada una serie, su matriz dodecafónica es una representación visual de su _espectro serial_; es decir, del conjunto de series derivadas de esa serie. La derivación se obtiene mediante tres funciones transformativas: la transposición (T), la inversión (I) y la retrogradación (R).

  ## ¿Para qué sirve?

  El espectro serial es todo el material compositivo sonoro del que se dispone para la composición de una obra dodecafónica. Al poder ordenar y disponer la información en una tabla, el compositor puede acceder a toda ella al mismo tiempo sin tener que calcular cada serie individualmente.

  ## ¿Cómo se introduce la serie?

  La serie se introduce a través del cuadro de texto blanco. Acepta series numéricas de longitudes arbitrarias entre 1 y 100, con los números separados entre espacios. También se puede generar una permutación aleatoria de la longitud especificada en el recuadro pequeño, entre 1 y 100, tras pulsar el botón de OK.

  ## ¿Cómo se lee?

  La matriz se lee en la dirección en la que aparece el nombre de la serie. Las series T se leen de izquierda a derecha, mientras que las series R de derecha a izquierda. Las series I se leen de arriba a abajo y las IR/RI de abajo a arriba.

  ## <a name="Numeración"></a>¿Qué es la numeración?

  La numeración es la forma de llamar a cada serie mediante un número para especificar cuántas veces se ha transpuesto con respecto a las demás series.

  La manera __Tradicional__ se ha usado desde al menos 1945, y consiste en usar T0 para la serie original. Esta manera es más rigurosa porque tiene una expresión matemática asociada: la aplicación y composición de funciones. Así, la serie T0 es aquella a la que no se le ha aplicado nada, y la I0 es a la que se le ha aplicado la inversión, pero ninguna transposición. En cambio, a R5 se le ha aplicado tanto la retrogradación como la 5-transposición.

  Además, la numeración tradicional hace distinción entre IR y RI, ya que en realidad no conmutan: el orden en el que se aplican las funciones importa. Por ello, es una ventaja no llamar de igual manera a series que no son iguales.

  La numeración de __Tonos Absolutos__ surgió de la mano de George Perle en su libro _Twelve Tone Tonality_ (1977). Consiste en llamar a cada serie por la nota por la que comienza - T e I - o termina - R o IR: por ejemplo, la serie original será T4 si comienza por la nota Mi. No tiene una expresión matemática clara y no distingue entre IR y RI, pero es también conocida y usada en la literatura serialista.

  ## <a name="Sintaxis"></a>¿Y la sintaxis?

  Igual que la numeración, la sintaxis es la forma de llamar a cada serie, pero mediante letras que indican las funciones que se le han aplicado.

  La sintaxis __Matemática__ surgió en mi trabajo como una necesidad frente a la inconsistencia de los convenios y a la opacidad de la notación, así como para acercar el significado matemático de las funciones a su sintaxis musical. Las notaciones de series, hasta ahora, no han reflejado transparentemente su verdadero significado.

  En la notación __Simple__, al escribir R5 no queda claro si se está aplicando primero la R o la T5, aunque realmente no importa demasiado porque ambas conmutan. Este problema empieza a ser tangible al incluir otras funciones transformativas como el desplazamiento cíclico, o al sustituir la I por la S y perder la conmutatividad de S y T. Por ello, en la forma matemática se especifica cada función que se aplica, y en el orden exacto.

  En la sintaxis simple el número aparece en posiciones muy distintas dependiendo del gusto de cada autor. Ha aparecido tras las letras, como subíndice, como superíndice, e incluso con paréntesis alrededor, aunque esto último no es recomendable ya que las funciones no se están _aplicando_ sobre ese número. De hecho, ese número es parte de esas funciones. No es una notación adecuada.

  En cambio, en la sintaxis matemática es importante que el número se encuentre en posición de superíndice. Al fin y al cabo, T⁶ no es más que la aplicación de T¹ seis veces. Por tanto, la función se está multiplicando sobre sí misma: es su exponente.

  De esta forma, en nomenclatura matemática la serie RIT⁶ es la transformación de la serie P mediante una 6-transposición, una inversión y una retrogradación, en ese orden. Es equivalente a escribir R( I( T⁶(P) ) ). Tiene deliberadamente el orden de aplicación de funciones.

"""
