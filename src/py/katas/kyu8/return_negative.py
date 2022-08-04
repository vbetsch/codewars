def make_negative(number):
    return -abs(number)


def test_make_negative():
    assert make_negative(15) == -15
    assert make_negative(5) == -5
    assert make_negative(0) == 0
    assert make_negative(-7) == -7
    assert make_negative(42) == -42
    assert make_negative(-9) == -9
