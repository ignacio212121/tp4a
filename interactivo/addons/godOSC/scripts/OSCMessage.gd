@icon("res://addons/godOSC/images/OSCMessage.svg")
class_name OSCMessage
extends Node
## Convenience class for organizing an OSC message. Used with an OSCClient. To add your own code, extend the script attached to the OSCReceiver you create by right clicking and "extend script"

## The client to send the OSC message with
@export var target_client : OSCClient

## The OSC address to send to
@export var osc_address := "/example"


func reiniciar():
	target_client.send_message(osc_address, ["reiniciar"])

func nucleo_terminado():
	target_client.send_message(osc_address, ["nucleo_terminado"])
	
func actividad_terminada():
	target_client.send_message(osc_address, ["actividad_terminada"])
