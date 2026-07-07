function fnAdicionarNoCarrinho(id){
    let lista_dos_codigos = localStorage.getItem("lista_dos_codigos")

    let listaDosProdutos = JSON.parse(lista_dos_codigos) || []
    listaDosProdutos.push(id)

    console.log(listaDosProdutos.length)
    
    let listaSemVazio = listaDosProdutos.filter(Boolean)
    let listaSemRepetido = [...new Set(listaSemVazio)]

    localStorage.setItem("lista_dos_codigos", JSON.stringify(listaSemRepetido))
    console.log("produto adicionado")
    fnMostrarNumeroDeProdutos()
}


function fnLimparCarrinho(){
    localStorage.clear()
    console.log("carrinho limpo")
} 

function fnMostrarNumeroDeProdutos(){
    let lista_dos_codigos = localStorage.getItem("lista_dos_codigos")
    let listaDosProdutos = JSON.parse(lista_dos_codigos) || []
        document.getElementById("numero_de_produtos").innerText = listaDosProdutos.length
}

fnMostrarNumeroDeProdutos()