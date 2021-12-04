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
        click_numbutton_random 2| Should Be "表示は 2 です"
    }
    Stop-Process -name Calculator
}

Describe "add" {
    Start-Process calc
    It "2桁の足し算" {
        add -num1 "10" -num2 "10"| Should Be "表示は 20 です"
    }
    Stop-Process -name Calculator
}