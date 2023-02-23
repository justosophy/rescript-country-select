%%raw(`import "./CountrySelect_Option.css"`)

module ReactSelectOption = {
  @module("react-select") @scope("components") @react.component
  external make: (
    ~innerRef: JsxDOM.domRef,
    ~label: string,
    ~className: string=?,
    ~isFocused: bool,
    ~isSelected: bool,
    @as("type") ~_type: {..},
    ~innerProps: {..},
    ~data: {..},
    ~isDisabled: {..},
    ~clearValue: {..},
    ~cx: {..},
    ~getStyles: {..},
    ~getClassNames: {..},
    ~getValue: {..},
    ~hasValue: {..},
    ~isMulti: {..},
    ~isRtl: {..},
    ~options: {..},
    ~selectOption: {..},
    ~selectProps: {..},
    ~setValue: {..},
    ~theme: {..},
    ~children: React.element,
  ) => React.element = "Option"
}

@react.component
let make = (
  ~innerRef: JsxDOM.domRef,
  ~label: string,
  ~isFocused: bool,
  ~isSelected: bool,
  @as("type") ~_type: {..},
  ~innerProps: {..},
  ~data: {..},
  ~isDisabled: {..},
  ~clearValue: {..},
  ~cx: {..},
  ~getStyles: {..},
  ~getClassNames: {..},
  ~getValue: {..},
  ~hasValue: {..},
  ~isMulti: {..},
  ~isRtl: {..},
  ~options: {..},
  ~selectOption: {..},
  ~selectProps: {..},
  ~setValue: {..},
  ~theme: {..},
) => {
  let focusedClass = isFocused ? " react-select--option--focused" : ""
  let selectedClass = isSelected ? " react-select--option--selected" : ""
  <ReactSelectOption
    innerRef
    label
    _type
    className={"react-select--option" ++ focusedClass ++ selectedClass}
    innerProps
    data
    isDisabled
    isFocused
    isSelected
    clearValue
    cx
    getStyles
    getClassNames
    getValue
    hasValue
    isMulti
    isRtl
    options
    selectOption
    selectProps
    setValue
    theme>
    <span>
      <span className={"fi fi-" ++ data["value"]} />
    </span>
    {React.string(label)}
  </ReactSelectOption>
}
