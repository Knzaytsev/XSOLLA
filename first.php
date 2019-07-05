<?php
class ResaleCaclulator
{
  public function calculateLowestLoss(array $prices): int
  {
    $min = PHP_INT_MAX;
    $cnt = count($prices);
    for($i = 0; $i < $cnt - 1; $i++){
      for($j = $i + 1; $j < $cnt; $j++){
          if($prices[$i] >= $prices[$j]){
          $curmin = $prices[$i] - $prices[$j];
          if($curmin < $min){
            $min = $curmin;
          }
        }
      }
    }
  return $min;
  }
}

$arr = array(210, 130, 50, 175, 100);

$c = new ResaleCaclulator();
$a = $c->calculateLowestLoss($arr);
echo $a;
?>