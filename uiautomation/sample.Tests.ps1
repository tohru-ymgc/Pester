$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "動作確認" {
    Start-Process calc
    It "電卓ボタン1を押下すると、結果表示が1になること" {
        click_numbutton_one| Should Be "表示は 1 です"
    }
    Stop-Process -name Calculator
}
Describe "数字ボタンの動作確認" {
    Start-Process calc
    It "電卓ボタン2を押下すると、結果表示が2になること" {
        click_numbutton "2"
        reading_result_display_area | Should Be "表示は 2 です"
    }
    Stop-Process -name Calculator
}

Describe "足し算" {
    Start-Process calc
    It "10と10を足すと20になること" {
        click_numbutton "10"
        Four_law_calculation_button "sum"
        click_numbutton "10"
        click_equalbutton
        reading_result_display_area | Should Be "表示は 20 です"
    }
    Stop-Process -name Calculator
}

Describe "引き算" {
    Start-Process calc
    It "100から99を引くと1になること" {
        click_numbutton "100"
        Four_law_calculation_button "subtract"
        click_numbutton "99"
        click_equalbutton
        reading_result_display_area | Should Be "表示は 1 です"
    }
    Stop-Process -name Calculator
}


Describe "multi" {
    Start-Process calc
    It "25と100を書けると2500になること" {
        click_numbutton "25"
        Four_law_calculation_button "multi"
        click_numbutton "100"
        click_equalbutton
        reading_result_display_area | Should Be "表示は 2,500 です"
    }
    Stop-Process -name Calculator
}


Describe "div" {
    Start-Process calc
    It "1000000から2を割ると500000になること" {
        click_numbutton "1000000"
        Four_law_calculation_button "div"
        click_numbutton "2"
        click_equalbutton
        reading_result_display_area | Should Be "表示は 500,000 です"
    }
    Stop-Process -name Calculator
}