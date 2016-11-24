$list = [];
for ($i = 0; $i < 10; $i++) {
    $list2 = [];
    for ($i2 = 0; $i2 < 60; $i2++) {
        $list2[]=['seat_no'=>($i+1).','.($i2+1),'user'=>rand(1, 9999)];
    }
    $list[]=$list2;
}