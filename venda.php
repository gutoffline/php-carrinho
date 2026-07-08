<?php
include "inc/conn.php";

$produtos = $_POST['produtos'];
$total = $_POST['total'];

$listaProdutos = explode("," , $produtos);

$sql = "insert into tb_vendas(id_cliente, total) values(1, $total)";

$resultado = mysqli_query($conexao, $sql);
$id_venda = mysqli_insert_id($conexao);
echo $id_venda;

foreach ($listaProdutos as $chave => $valor) {
    $sql = "insert into tb_itens_venda(id_venda, id_produto, qtd_vendido) values($id_venda, $valor , 1)";
    $resultado = mysqli_query($conexao, $sql);
}





?>