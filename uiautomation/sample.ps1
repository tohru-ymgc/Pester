Import-Module "UIAutomation.dllが格納されているパス先を指定"
[UIAutomation.Preferences]::Highlight=$false
function click_numbutton_one {
    $wndw = Get-UiaWindow -Name '電卓' # 対象のアプリを指定する
    $wndw | Get-UiaButton -AutomationId 'num1Button' | Invoke-UiaButtonClick | Out-Null  #電卓の[1]ボタンを指定し、クリックする
    $wndw | Get-UiaText -AutomationID 'CalculatorResults' | Read-UIAControlName #電卓の計算結果表示エリアに表示されている数値を取得する
}
function click_numbutton([string]$num) {
    $i = 0
    $wndw = Get-UiaWindow -Name '電卓'
    while([String]::IsNullOrEmpty($num[$i]) -eq $false)
    {
        $wndw | Get-UiaButton -AutomationId "num$($num[$i])Button" | Invoke-UiaButtonClick | Out-Null
        $i++
    }
}

function Four_law_calculation_button([string]$key) { # 演算子の+、-、*、/のボタンを押下する
    $calculation = @{
        "sum" = [string]"plusButton"
        "subtract" = [string]"minusButton"
        "multi" = [string]"multiplyButton"
        "div" = [string]"divideButton"
    }
    $selectbutton = $calculation[$key]
    $wndw = Get-UiaWindow -Name '電卓'
    $wndw | Get-UiaButton -AutomationId $selectbutton | Invoke-UiaButtonClick | Out-Null
}

function click_equalbutton { #"="ボタンを押下する
    $wndw = Get-UiaWindow -Name '電卓'
    $wndw | Get-UiaButton -AutomationId "equalButton" | Invoke-UiaButtonClick | Out-Null
}

function reading_result_display_area { #結果表示エリアに表示されている数値を取得する
    $wndw = Get-UiaWindow -Name '電卓'
    $wndw | Get-UiaText -AutomationID 'CalculatorResults' | Read-UIAControlName #電卓の計算結果表示エリアに表示されている数値を取得する
}
