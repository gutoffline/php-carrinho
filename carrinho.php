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
    </tr>
<?php
    $listaDeProdutos = $_POST['produtos'];
    
    //$sql = "select * from tb_produtos where id in ($listaDeProdutos) ";
    $sql = "select ID, NOME, QTD, PRECO,( select sum(preco) from tb_produtos where id in ($listaDeProdutos)) as TOTAL from tb_produtos where id in ($listaDeProdutos)";

    $resultado = mysqli_query($conexao, $sql);
    while($linha = mysqli_fetch_assoc($resultado)){
        echo "<tr>";
        echo "<td>{$linha['ID']}</td>";
        echo "<td>{$linha['NOME']}</td>";
        echo "<td>{$linha['PRECO']}</td>";
        $total = $linha['TOTAL']; 
        
        echo "</tr>";
    }
     
?> 
    <tr>
        <td>&nbsp;</td>
        <td align="right">TOTAL</td>
        <td> <?=$total?> </td>
    </tr>
</table>
<?php
mysqli_close($conexao);
include "inc/footer.php";
?>