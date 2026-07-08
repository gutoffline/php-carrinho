<?php
include "inc/conn.php";
include "inc/header.php";
?>
<h1>Carrinho</h1>


<table class="table table-striped table-hover">
    <tr>
        <th>ID</th>
        <th>PRODUTO</th>
        <th>PREÇO</th>
        <th>&nbsp;</th>
    </tr>
<?php
    $listaDeProdutos = $_POST['produtos'];
    
    //$sql = "select * from tb_produtos where id in ($listaDeProdutos) ";
    $sql = "select ID, NOME, QTD, PRECO,( select sum(preco) from tb_produtos where id in ($listaDeProdutos)) as TOTAL from tb_produtos where id in ($listaDeProdutos)";

    $resultado = mysqli_query($conexao, $sql);
    while($linha = mysqli_fetch_assoc($resultado)){
        echo "<tr id='linha{$linha['ID']}'>";
        echo "<td>{$linha['ID']}</td>";
        echo "<td>{$linha['NOME']}</td>";
        echo "<td>{$linha['PRECO']}</td>";
        echo "<td><button class='btn btn-danger' onclick='fnExcluir({$linha['ID']})'>Excluir</button></td>";
        $total = $linha['TOTAL']; 
        
        echo "</tr>";
    }
     
?> 
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td align="right">TOTAL</td>
        <td> <span id="total"><?=$total?></span> </td>
    </tr>
</table>
<form id="form_venda" method="post" action="venda.php">
    <input name="produtos" id="produtos_venda">
    <input name="total" id="total_venda">
    <button type="button" class="btn btn-success" onclick="fnFecharCompra()">FECHAR COMPRA</button>
</form>
<?php
mysqli_close($conexao);
include "inc/footer.php";
?>