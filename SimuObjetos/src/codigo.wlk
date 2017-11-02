class Cientifico{ 
	var empleados=[]
	
	method ordenar(empleado,orden){
		empleado.realizar(orden)
	}
	
	 
}

class Empleado{
	var rol
	var estamina
	
	constructor(_rol,_estamina){
	rol = _rol
	estamina=_estamina
	}
	
	method estamina()= estamina
	
	method realizar(orden){
		
		if (orden.laPuedeRealizar(self)){ 
		orden.esRealizada(self)
		} else {
			throw new Exception("Este empleado no puede realizar esta tarea")
		}
	}	
	
	method herramientas() = rol.herramientas()
	
	method tieneHerramieta(n) = self.herramientas().contains(n)
}


class Biclope inherits Empleado{
	
	override method estamina()= 10.max(estamina)
}

class Ciclope inherits Empleado{ 
	
}



/////////////////////////////////////////////////////////////////////////////////////////////////////////


class Rol{
	
	
	method cambiarRol(rol)
	
	method herramientas()= []
}

class Soldado inherits Rol{
	var arma
	var practica
	
	method usarArma(){
		practica=+1
		arma.aumentarDano()
	}
	
	override method efectuar(orden){}
	
}

class Arma{
	var dano
	
	method aumentarDano(){
		dano=+1
	}
	
	method danoCausa()=dano
}

class Obrero inherits Rol{
	var herramientas = []
	
	override method herramientas()=herramientas
}

class Mucama inherits Rol{
 	
}




//////////////////////////////////////////////////////////////////////////////





class Tarea {
	
}

class ArreglarMaquina {
	var requiere =[]
	var maquina
	
	method laPuedeRealizar(empleado) = self.estaminaSuficiente(empleado) && self.herramientasSuficientes()
	
	method estaminaSuficiente(empleado) = empleado.estamina() >= maquina.complejidad()
	
	method herramientasSuficiente(empleado) = requiere.all({n=>empleado.tieneHerramienta(n)})
	
	method esRealizada(empleado){
	
	}
	
	
}	

class Maquina {
	var complejidad
	
	method complejidad() = complejidad
	
}









