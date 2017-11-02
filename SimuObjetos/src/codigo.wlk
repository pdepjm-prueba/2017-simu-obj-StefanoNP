class Cientifico{ 
	var empleados=[]
	
	method ordenar(empleado,tarea){
		empleado.realizar(tarea)
	}
	
	 
}

class NopuedeHacerTarea inherits Exception{}

class Empleado{
	var rol
	var estamina
	var tareas=[]
	
	constructor(_rol,_estamina){
	rol = _rol
	estamina=_estamina
	}
	method fuerza()= estamina/2 + 2 + rol.fuerzaRol()
	
	method estamina()= estamina
	
	method pierdeEstamina(cant){ 
		estamina=-cant
	}
	
	method realizar(tarea){
		
		if (tarea.laPuedeRealizar(self)){ 
		tarea.esRealizada(self)
		tareas.add(tarea)
		} else {
			throw new NoPuedeHacerTarea("Este empleado no puede realizar esta tarea")
		}
	}	
	
	method herramientas() = rol.herramientas()
	method noEsMucama() = rol.noEsMucama()
	
	method tieneHerramieta(n) = self.herramientas().contains(n)
	
	method factor()
	
	method experiencia() = tareas.size()+tareas.sum({n=>n.dificultad()})
	
}


class Biclope inherits Empleado{
	
	override method estamina()= 10.max(estamina)
	
	method calculaDificultad(gradoAmenaza)= gradoAmenaza
	
	method factorDif() = 1
	
} 
class Ciclope inherits Empleado{
	
	override method fuerza() = super()/2
	
	method calculaDificultad(gradoAmenaza)= gradoAmenaza*2
	
	method factorDif() = 2
}

////////////////////////////////////////


class Rol{
	
	
	method cambiarRol(rol)
	
	method herramientas()= []
	method noEsMucama() = true
	
	method fuerzaRol() = 0
}

class Soldado inherits Rol{
	var arma
	var practica
	
	method usarArma(){
		practica=+1
		arma.aumentarDano()
	}
	
	override method fuerzaRol() = practica
	
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
	
	override method noEsMucama() = false
 	
}




//////////////////////////////////////////////////////////////////////////////





class Tarea {
	
	method laPuedeRealizar(empleado)
	method esRealizada(empleado)
	method dificultad(empleado)
}

class ArreglarMaquina inherits Tarea{
	var requiere =[]
	var complejidadMaquina
	
	constructor(_requiere,_complejMaq){
	requiere = _requiere
	complejidadMaquina=_complejMaq
	}
	
	override method laPuedeRealizar(empleado) = self.estaminaSuficiente(empleado) && self.herramientasSuf(empleado)
	
	method estaminaSuficiente(empleado) = empleado.estamina() >= complejidadMaquina
	method herramientasSuf(empleado) = requiere.all({n=>empleado.tieneHerramienta(n)})

	override method esRealizada(empleado){
		empleado.pierdeEstamina(complejidadMaquina)
	}
	
	method dificultad(empleado)=2*complejidadMaquina
	
}	


class DefenderSector inherits Tarea{
	var gradoAmenaza
	
	constructor(_grado){
	gradoAmenaza = _grado
	}
	
	override method laPuedeRealizar(empleado) = empleado.noesMucama() && empleado.fuerza() >= gradoAmenaza
	
	override method esRealizada(empleado){
		empleado.pierdeEstamina(empleado.estamina()/2)
	}
	
	method dificultad(empleado) = gradoAmenaza * empleado.factorDif()
}


class LimpiarSector inherits Tarea {
	var dificultad 
	
	method setDificultad(dif) {
		dificultad = dif
	}
	
	method dificultad()=
	
}