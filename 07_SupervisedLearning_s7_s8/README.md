# Aprendizaje Supervisado

## Obtención del material del curso

Para ir acostumbrándonos a como se suele trabajar con el material de cuadernos y entornos de Machine Learning, obtendremos el material del curso desde un repositorio Git.

## Instalación y activación del entorno

Vamos a crear un entorno de Anaconda que sirva tanto para Supervised Learning como para las sesiones posteriores de Deep Learning con Tensorflow. Llamaremos a nuestro entorno **ks-sl** (acrónimo de KSchool Supervised Learning).

Sigue los siguientes pasos para crear el entorno:

1. Activa Anaconda, si es que lo tenías desactivado. Activar Anaconda signifca que los ejecutables de conda estén en tu variable `$PATH`
2. Crea un nuevo entorno Anaconda:

	```Shell
	$ conda env create -f environment.yml
	```
	
	Si quieres usar una GPU porque tu portátil o entorno nube disponga de una, edita el fichero `environment.yml` y sustituye `tensorflow=2.0.0` por `tensorflow-gpu=2.0.0`. También deberías sustituir `tensorflow-serving-api=2.0.0` por `tensorflow-serving-api-gpu=2.0.0`.
	
3. Activa el nuevo entorno que has creado:

	```Shell
	$ conda activate ks-sl
	```

3. Añade el nuevo entorno como kernel de Jupyter:


	```Shell
	$ python -m ipykernel install --user --name=ks-sl
	```
	
	Hemos utilizado un nombre personalizado distinto al nombre `python3` que los notebooks de Jupyter abrirán por defecto. Por ello, cada vez que abras un notebook en la lase, tendrás que seleccionar el Kernel correcto yendo a `Kernel > Change kernel...` en Jupyter y seleccionando el kernel `ks-sl` cada vez que abras un notebook nuevo de esta clase.
	
4. Ahora puedes arrancar Jupyter así:

	```Shell
	$ jupyter notebook
	```

	Este comando debería abrir tu navegador, y deberías ver la vista en árbol de Jupyter con los contenidos de tu directorio. Si por cualquier razón tu navegador no se abre automáticamente, ve a [localhost:8080](localhost:8080). 

### Apagar Jupyter
Cuando hayas acabado con Jupyter, puedes cerrarlo sin más que pulsar `Ctrl + C` en la ventana de terminal en la que lo hayas abierto.

Cada vez que quieras volver a trabajar en los cuadernos de esta clase, deberás abrir un nuevo terminal y ejecutar:

	```Shell
	$ cd <directorio donde están los cuadernos ipynb>
	$ conda activate ks-sl
	$ jupyter notebook
	```

### Desactivar el entorno

Si tienes que trabajar en otros materiales del curso y necesitas desactivar este entorno, no tienes más que introducir en tu terminal:

```Shell
$ conda deactivate
```

Para volver a activalo, puedes hacer `conda activate ks-sl`.

# Eliminar el entorno

El entorno que has creado para estas clases puede serte útil si vas a basar tu trabajo fin de máster en alguna de las cosas que hemos visto en clase (Supervised Learning y Deep Learning). Si quieres eliminar el entorno una vez haya finalizado el máster para liberar tu portátil de configuración innecesaria, puedes seguir estos pasos:

1. Primero, asegúrate de que estás en el entorno correcto con `conda env list`. El entorno **`ks-sl`** debería aparecer en el listado y con un asterisco a su izquierda, que denota que está activo.
2. Desactiva el entorno con `conda deactivate`.
3. Finalmente, elimina el entorno haciendo	
	```Shell
	conda remove --name ks-sl --all
	```
4. Verifica que el entorno que acabas de borrar no aparece ya en la lista de entornos instalados haciendo un `conda env list`.


