%%raw(`import "./CountrySelect_Control.css"`)

module ReactSelectControl = {
  @module("react-select") @scope("components") @react.component
  external make: (
    ~innerRef: JsxDOM.domRef,
    ~isFocused: bool,
    ~menuIsOpen: bool,
    ~hasValue: bool,
    ~className: string=?,
    ~innerProps: {..},
    ~isDisabled: {..},
    ~clearValue: {..},
    ~cx: {..},
    ~getStyles: {..},
    ~getClassNames: {..},
    ~getValue: {..},
    ~isMulti: {..},
    ~isRtl: {..},
    ~options: {..},
    ~selectOption: {..},
    ~selectProps: {..},
    ~setValue: {..},
    ~theme: {..},
    ~children: React.element,
  ) => React.element = "Control"
}

@react.component
let make = (
  ~innerRef: JsxDOM.domRef,
  ~isFocused: bool,
  ~menuIsOpen: bool,
  ~hasValue: bool,
  ~innerProps: {..},
  ~isDisabled: {..},
  ~clearValue: {..},
  ~cx: {..},
  ~getStyles: {..},
  ~getClassNames: {..},
  ~getValue: {..},
  ~isMulti: {..},
  ~isRtl: {..},
  ~options: {..},
  ~selectOption: {..},
  ~selectProps: {..},
  ~setValue: {..},
  ~theme: {..},
  ~children: React.element,
) => {
  <ReactSelectControl
    className="react-select--control"
    innerRef
    isFocused
    menuIsOpen
    hasValue
    innerProps
    isDisabled
    clearValue
    cx
    getStyles
    getClassNames
    getValue
    isMulti
    isRtl
    options
    selectOption
    selectProps
    setValue
    theme>
    <span className="react-select--control--icon" />
    {children}
  </ReactSelectControl>
}
