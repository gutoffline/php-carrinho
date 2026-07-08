function fnAdicionarNoCarrinho(id){
    let lista_dos_codigos = localStorage.getItem("lista_dos_codigos")

    let listaDosProdutos = JSON.parse(lista_dos_codigos) || []
    listaDosProdutos.push(id)

    console.log(listaDosProdutos.length)
    
    let listaSemVazio = listaDosProdutos.filter(Boolean)
    let listaSemRepetido = [...new Set(listaSemVazio)]

    localStorage.setItem("lista_dos_codigos", JSON.stringify(listaSemRepetido))
    document.getElementById("produtos").value=listaSemRepetido
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

    document.getElementById("produtos").value=listaDosProdutos
}

function fnExcluir(id){
    document.getElementById("linha"+id).remove()
    let lista_dos_codigos = localStorage.getItem("lista_dos_codigos")
    let listaDosProdutos = JSON.parse(lista_dos_codigos) || []

    let listaNova = listaDosProdutos.filter(item => item !== id)
    console.log(listaNova)

    localStorage.setItem("lista_dos_codigos", JSON.stringify(listaNova))
    document.getElementById("produtos").value = listaNova

    document.getElementById("form_produtos").submit()

    
}


function fnFecharCompra(){
    document.getElementById("produtos_venda").value = document.getElementById("produtos").value
    document.getElementById("total_venda").value = document.getElementById("total").innerText
    document.getElementById("form_venda").submit()

}

fnMostrarNumeroDeProdutos()