function fnAdicionarNoCarrinho(id){
    let lista_dos_codigos = localStorage.getItem("lista_dos_codigos")

    let listaDosProdutos = JSON.parse(lista_dos_codigos) || []
    listaDosProdutos.push(id)

    console.log(listaDosProdutos.length)
    
    let listaSemVazio = listaDosProdutos.filter(Boolean)
    let listaSemRepetido = [...new Set(listaSemVazio)]

    localStorage.setItem("lista_dos_codigos", JSON.stringify(listaSemRepetido))
    console.log("produto adicionado")
}


function fnLimparCarrinho(){
    localStorage.clear()
    console.log("carrinho limpo")
}