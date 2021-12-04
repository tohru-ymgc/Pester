Import-Module "UIAutomation.dllが格納されているパス先を指定"
[UIAutomation.Preferences]::Highlight=$false
function click_numbutton_one {
    $wndw = Get-UiaWindow -Name '電卓'
    $wndw | Get-UiaButton -AutomationId 'num1Button' | Invoke-UiaButtonClick | Out-Null
    $wndw | Get-UiaText -AutomationID 'CalculatorResults' | Read-UIAControlName
    Save-UiaScreenshot
}

function click_numbutton_random ([string]$num) {
    $wndw = Get-UiaWindow -Name '電卓'
    $wndw | Get-UiaButton -AutomationId "num$($num)Button" | Invoke-UiaButtonClick | Out-Null
    $wndw | Get-UiaText -AutomationID 'CalculatorResults' | Read-UIAControlName
}

function add([string]$num1,[string]$num2) {
    $i = 0
    $j = 0

    $wndw = Get-UiaWindow -Name '電卓'

    while([String]::IsNullOrEmpty($num1[$i]) -eq $false)
    {
        $wndw | Get-UiaButton -AutomationId "num$($num1[$i])Button" | Invoke-UiaButtonClick | Out-Null
        $i++
    }

    $wndw | Get-UiaButton -AutomationId "plusButton" | Invoke-UiaButtonClick | Out-Null

    while([String]::IsNullOrEmpty($num2[$j]) -eq $false)
    {
        $wndw | Get-UiaButton -AutomationId "num$($num2[$j])Button" | Invoke-UiaButtonClick | Out-Null
        $j++
    }
    $wndw | Get-UiaButton -AutomationId "equalButton" | Invoke-UiaButtonClick | Out-Null
    $wndw | Get-UiaText -AutomationID 'CalculatorResults' | Read-UIAControlName
}