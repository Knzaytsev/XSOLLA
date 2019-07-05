<?php
$data = json_decode(file_get_contents('php://input'), true);
$children = $data["children"];
/*Алгоритм решения задачи*/
$cnt = count($children);										//Количество детей
$curCnt = $cnt;													//Счётчик для подсчёта оставшихся детей
$curElement = 0;												//Текущий ребёнок без смещения
$count = $data["count"] - 1;									//Количество детей в считалке
for($i = 0; $i < $cnt - 1; $i++){
      $curElement = ($curElement + $count) % $curCnt;			//Вычисление текущего ребёнка
      array_splice($children, $curElement, 1);					//Уменьшение массива
      $curCnt = $curCnt - 1;									//Уменьшение оставшихся детей
    }
$res = array('name' => $children[0]);
/*Конец алгоритма*/
echo json_encode($res);