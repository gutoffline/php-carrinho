<?php
include "inc/header.php";
include "inc/conn.php";
?>
<h1>Produtos</h1>
<table border="2">
    <tr>
        <th>ID</th>
        <th>PRODUTO</th>
        <th>QUANTIDADE ATUAL</th>
        <th>PREÇO</th>
        <th>AÇÕES</th>
    </tr>
<?php
    $sql = "select * from tb_produtos";
    $resultado = mysqli_query($conexao, $sql);
    while($linha = mysqli_fetch_assoc($resultado)){
        echo "<tr>";
        echo "<td>{$linha['ID']}</td>";
        echo "<td>{$linha['NOME']}</td>";
        echo "<td>{$linha['QTD']}</td>";
        echo "<td>{$linha['PRECO']}</td>";
        echo "<td><button>adicionar ao carrinho</button>";
        echo "</tr>";
    }
?>
</table>
<?php
mysqli_close($conexao);
include "inc/footer.php";
?>
    
