%%raw(`import "./CountrySelect_Menu.css"`)

module ReactSelectMenu = {
  @module("react-select") @scope("components") @react.component
  external make: (
    ~innerRef: JsxDOM.domRef,
    ~isLoading: bool,
    ~className: string=?,
    ~innerProps: {..},
    ~placement: {..},
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
    ~minMenuHeight: {..},
    ~maxMenuHeight: {..},
    ~menuPlacement: {..},
    ~menuPosition: {..},
    ~menuShouldScrollIntoView: {..},
    ~children: React.element,
  ) => React.element = "Menu"
}

@react.component
let make = (
  ~innerRef: JsxDOM.domRef,
  ~isLoading: bool,
  ~innerProps: {..},
  ~placement: {..},
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
  ~minMenuHeight: {..},
  ~maxMenuHeight: {..},
  ~menuPlacement: {..},
  ~menuPosition: {..},
  ~menuShouldScrollIntoView: {..},
  ~children: React.element,
) => {
  <ReactSelectMenu
    className="react-select--menu"
    innerRef
    isLoading
    innerProps
    placement
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
    theme
    minMenuHeight
    maxMenuHeight
    menuPlacement
    menuPosition
    menuShouldScrollIntoView>
    {children}
  </ReactSelectMenu>
}
