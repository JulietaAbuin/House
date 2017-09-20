class Enfermedad{
	var celulasAmenazadas
	constructor(celulasAmen){celulasAmenazadas = celulasAmen}
	method celulasAmenazadas(){return celulasAmenazadas}
	method atenuar(cant){
		celulasAmenazadas -= cant
	}
}
class LaMuerte inherits Enfermedad{
	constructor(celulasAmen)=super(celulasAmen)
	override method atenuar(c){}
	method efecto(persona){
		persona.bajarTemp()
	}
}
class Infecciosa inherits Enfermedad{
	method efecto(persona){
		persona.aumentaTemp(celulasAmenazadas/1000)
	}
	method reproducirse(){celulasAmenazadas*=2}
}
class Autoinmune inherits Enfermedad{
	method efecto(persona){
		persona.destruirCelulas(celulasAmenazadas)
	}
}
class Persona{
	var temperatura = 35
	var enfermedades = []
	var celulas = 1000000
	method bajarTemp(){ temperatura = 0}
	method contraerEnfermedad(enfermedad){
		enfermedades.add(enfermedad)
	}
	method recibirMedicamento(dosis){
		enfermedades.forEach({e => e.atenuar(dosis*15)})
		enfermedades.forEach({e => if (e.celulasAmenazadas() <= 0) enfermedades.remove(e)}) 
		
	}
	method aumentaTemp(cant){
		temperatura +=cant
	}
	method destruirCelulas(c){
		celulas -= c
	}
	method vivirUnDia(){
		enfermedades.forEach({enfermedad =>enfermedad.efecto(self)})
	}
}
class Medico inherits Persona{
	var dosis
	constructor(_dosis){
		dosis= _dosis
	}
	method atender(persona){
		persona.recibirMedicamento(dosis)
	}
		
		}
