object castilloTotal{
	const castillos=[]
	method derrota(c){
		castillos.remove(c)
	}
	method crearCastillo(n){
		castillos.add(new Castillo(nombre=n))
	}
}
class Guardia{
	var cansancio=3
	var capacidad=10
	method defender(){
		cansancio-= 2
		return capacidad
	}
	method capacidad(){
		return capacidad
		}
	method descansar(){
		cansancio=cansancio + 10
	}	
}
class Rey{
	const carisma
	method carisma(){
		return carisma
	}
}

class Burocratas{
	var estado=0
	const nombre=[]
	const fecha=[]
	const experiencia=[]
	method estado(){
		return estado
	}
	method setEstado(e){
		 estado=e
	}
	method fiesta(f){
		if (estado>=2) {estado=estado-(2/(5-f))} else {estado=0} 
	}	
}
class Castillo{
	const nombre=[]
	const guardias=[]
	const burocratas=[]
	const batallon=[]
	const muralla=[]
	const ambiente=[]
	const rey=[]
	var carisma=0
	var estabilidad=100
	var vmuralla=0
	var ataque=0
	var suma=0
	var burocratasInt=0
	method nuevoRey(r){
		rey.clear()
		rey.add(r)
	}
	method fiesta(){
		if (estabilidad>25) {
		rey.forEach({ n => carisma = carisma + n.carisma() })
		burocratas.forEach({n => n.fiesta(carisma)})
		
		guardias.forEach({n => n.descansar()})}
	}
	method ataque(){
		ataque=0
		return guardias.forEach({n =>ataque = ataque + n.capacidad()})
	}
	method agregarBurocrata(nom,f,ex){
		const persona = new Burocratas(nombre=nom,fecha=f,experiencia=ex)
		burocratas.add(persona)
		ambiente.add(persona)
	}
	method agregarGuardia(){
		const guardia = new Guardia()
		guardias.add(guardia)
		muralla.add(guardia)
	}
	method planearDefensa(){
		burocratasInt=0
		suma=0
		burocratas.forEach({n => burocratasInt = burocratasInt + (10- n.estado() )})
		guardias.forEach({ n => suma = suma + n.defender() })
		estabilidad=estabilidad+(suma)/(100-burocratasInt)
		vmuralla=muralla+1
	}
	method defensa(){
		return estabilidad
	}
	method setDefensa(d){
		 estabilidad=d
	}
	method defensaPerdida(){
		muralla.forEach({ n => n.setEstado(15)})
	}
	method derrota(){
		castilloTotal.derrota(self)
	}
	method moverPersonal(persona, lugar,destino){
		if (lugar.contains(persona))
		{lugar.remove(persona)
		destino.add(persona)}
	}
	method setMuralla(m){
		vmuralla=m
	}
	method atacar(x){
		ataque=0
		batallon.forEach({ n => ataque = ataque + n.capacidad() })
		if (x.defensa()> ataque) 
			{x.setDefensa(x.defensa()-ataque)
			x.defensaPerdida() 
			if (muralla>3){x.setMuralla(0)}
		}
			 else {x.derrota()}
	}
}