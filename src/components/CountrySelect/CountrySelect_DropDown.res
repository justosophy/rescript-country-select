%%raw(`import "./CountrySelect_Dropdown.css"`)

@react.component
let make = (
  ~isOpen: bool,
  ~target: React.element,
  ~onClose: unit => unit,
  ~children: React.element,
) => {
  <div className="countryselect--dropdown">
    {target}
    {isOpen ? <div className="countryselect--dropdown--menu"> {children} </div> : React.null}
    {isOpen
      ? <div
          className="countryselect--dropdown--cover" onClick={React.useCallback0(_ => onClose())}
        />
      : React.null}
  </div>
}
