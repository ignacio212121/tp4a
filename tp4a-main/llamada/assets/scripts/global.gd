extends Node

var colores: Array = [Color("#13DD0F"), Color("#E8007D"), Color("#0017EC"), Color("#9D08E8"), Color("#FF3D00")]

var contenido_llamadas = [
	[{
		"titulo": "USO DE IA EN EMPRESAS",
		"mensaje_usuario": " ¿Cuanto ha aumento el uso de la ia generativa en las empresas?",
		"respuesta_ia": " *Respuesta*",
		"video": "actividad_01",
	}, {
		"titulo": "SUS USOS MÁS COMUNES",
		"mensaje_usuario": " ¿Puedes redimensionar esta imagén para mi cafeteria?",
		"respuesta_ia": " *Respuesta*",
		"video": "actividad_02",
	}, {
		"titulo": "SUS USOS MÁS COMUNES",
		"mensaje_usuario": " Súbeme la calidad de esta foto, es de la cafeteria",
		"respuesta_ia": " *Respuesta*",
		"video": "actividad_03",
	}, {
		"titulo": "MIEDO EN LAS EMPRESAS",
		"mensaje_usuario": " NO! ¿QUÉ ESTÁ PASANDO?",
		"respuesta_ia": " Transferencia cancelada",
		"video": "actividad_04",
	}, {
		"titulo": "",
		"mensaje_usuario": " ...",
		"respuesta_ia": " Llamada finalizada",
		"video": "actividad_05",
	}], ##########################################FIN NUCLEO 1
	[{
		"titulo": "VENTAJAS DE IA",
		"mensaje_usuario": " Hola, necesito generar un flyer sobre el curso de fotografía que estoy por iniciar, este se realizará en Diciembre.",
		"respuesta_ia": " *Respuesta*",
		"video": "actividad_01",
	}, {
		"titulo": "VENTAJAS DE IA",
		"mensaje_usuario": " Me gusta, pero quisiera que sea de color amarillo y cuente con los logos de algunos programas de edición de imagen.",
		"respuesta_ia": " *Respuesta*",
		"video": "actividad_02",
	}, {
		"titulo": "DESVENTAJAS DE IA",
		"mensaje_usuario": " Quisiera que sea un amarillo más claro y al final lo quiero en forma de post de Instagram.",
		"respuesta_ia": " *Respuesta*",
		"video": "actividad_03",
	}, {
		"titulo": "DESVENTAJAS DE IA",
		"mensaje_usuario": " Esta bien, ya pagué el premium. Quisiera que sea un amarillo más claro y al final lo quiero en forma de post de Instagram.",
		"respuesta_ia": "*Respuesta*",
		"video": "actividad_04",
	}, {
		"titulo": "DESVENTAJAS DE",
		"mensaje_usuario": " Hola de nuevo, necesito generar una pagina web para la venta de telefonos.",
		"respuesta_ia": "*Respuesta*",
		"video": "actividad_05",
	}, {
		"titulo": "DESVENTAJAS DE IA",
		"mensaje_usuario": " Se parece mucho al estilo de una marca conodia,queria algo original. ",
		"respuesta_ia": " LLamada Finalizada",
		"video": "actividad_06",
	}], ##########################################FIN NUCLEO 2
	 [{
		"titulo": "IA Y LA CREATIVIDAD",
		"mensaje_usuario": " Necesito referencias para animar a un personaje caminando",
		"respuesta_ia": " *Respuesta*",
		"video": "actividad_01",
	}, {
		"titulo": "IA Y LA CREATIVIDAD",
		"mensaje_usuario": " ¡Genial! Ahora puedo concentrarme en animar. Ahora necesito ver a este personaje pero en estilo 3D.",
		"respuesta_ia": " *Respuesta*",
		"video": "actividad_02",
	}, {
		"titulo": "IA Y LA CREATIVIDA",
		"mensaje_usuario": " Bien. Ahora ¿podrías darme ideas para una ilustración escolar de varios niños en un salón de clases?",
		"respuesta_ia": " *Respuesta*",
		"video": "actividad_03",
	}, {
		"titulo": "IA Y LA CREATIVIDA",
		"mensaje_usuario": " En base a estas ideas se me acaba de ocurrir un diseño nuevo y mejor. ¡Gracias!",
		"respuesta_ia": " *Respuesta*",
		"video": "actividad_04",
	}, {
		"titulo": "",
		"mensaje_usuario": "",
		"respuesta_ia": "",
		"video": "actividad_05",
	}], ##########################################FIN NUCLEO 3 
	[{
		"titulo": "HERRAMIENTAS DE LA IA",
		"mensaje_usuario": " Hola, trabajo en marketing y nos pidieron que utilicemos la IA Generativa para nuestras entregas. ¿Qué pasos debo tener en cuenta para utilizarla?",
		"respuesta_ia": " *Respuesta*",
		"video": "actividad_01",
	}, {
		"titulo": "HERRAMIENTAS DE LA IA",
		"mensaje_usuario": " ¿Podrias darme un ejemplo de cómo se veria un anuncio publicitario hecho por IA?",
		"respuesta_ia": " *Respuesta*",
		"video": "actividad_02",
	}, {
		"titulo": "HERRAMIENTAS DE LA IA",
		"mensaje_usuario": "Con Leonardo.Ai",
		"respuesta_ia": " *Respuesta*",
		"video": "actividad_03",
	}, {
		"titulo": "HERRAMIENTAS DE LA IA",
		"mensaje_usuario": "Necesito generar un anuncio para un festival de música en La Plata, es sobre rock.",
		"respuesta_ia": " *Respuesta*",
		"video": "actividad_04",
	}, {
		"titulo": "HERRAMIENTAS DE LA IA",
		"mensaje_usuario": " Me gusta el estilo, pero podria ser en tonos naranja y un estilo mas dibujado.",
		"respuesta_ia": " *Respuesta*",
		"video": "actividad_05",
	}], ##########################################FIN NUCLEO 4 
	[{
		"titulo": "PROMPTS",
		"mensaje_usuario": " Diseño para un PetShop.",
		"respuesta_ia": " *Respuesta*",
		"video": "actividad_01",
	}, {
		"titulo": "PROMPTS",
		"mensaje_usuario": " No es lo que esperaba, intentemos de vuelta. Diseño de mascotas con elementos de un PetShop.",
		"respuesta_ia": " *Respuesta*",
		"video": "actividad_02",
	}, {
		"titulo": "PROMPTS",
		"mensaje_usuario": " ¡Un poco mejor! sigamos intentando. Ilustración de un perro y un gato la cual contenga la palabra PETSHOP y algún elemento como una correa y un corazón.",
		"respuesta_ia": " *Respuesta*",
		"video": "actividad_03",
	}, {
		"titulo": "",
		"mensaje_usuario": "",
		"respuesta_ia": "",
		"video": "actividad_04",
	}, {
		"titulo": "",
		"mensaje_usuario": "",
		"respuesta_ia": "",
		"video": "actividad_05",
	}] ##########################################FIN NUCLEO 5
]
