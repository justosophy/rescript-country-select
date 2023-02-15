module ReactSelectOption = {
  @module("react-select") @scope("components") @react.component
  external make: (
    ~innerRef: JsxDOM.domRef,
    ~label: string,
    @as("type") ~_type: {..},
    ~className: {..},
    ~innerProps: {..},
    ~data: {..},
    ~isDisabled: {..},
    ~isFocused: {..},
    ~isSelected: {..},
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

module IconOption = {
  @react.component
  let make = (
    ~innerRef: JsxDOM.domRef,
    ~label: string,
    @as("type") ~_type: {..},
    ~className: {..},
    ~innerProps: {..},
    ~data: {..},
    ~isDisabled: {..},
    ~isFocused: {..},
    ~isSelected: {..},
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
    <ReactSelectOption
      innerRef
      label
      _type
      className
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
      <div className="react-select--flag-option">
        <span>
          <span className={"fi fi-" ++ data["value"]} />
        </span>
        {React.string(label)}
      </div>
    </ReactSelectOption>
  }
}

module ReactSelectSingleValue = {
  @module("react-select") @scope("components") @react.component
  external make: (
    ~className: {..},
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
  ) => React.element = "SingleValue"
}

module IconSingleValue = {
  @react.component
  let make = (
    ~className: {..},
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
    <ReactSelectSingleValue
      className
      innerProps
      data
      isDisabled
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
      <div className="react-select--flag-option">
        <span>
          <span className={"fi fi-" ++ data["value"]} />
        </span>
        {React.string(data["label"])}
      </div>
    </ReactSelectSingleValue>
  }
}

module ReactSelect = {
  type optionType = {"value": string, "label": string}

  @module("react-select") @react.component
  external make: (
    ~className: string=?,
    ~value: optionType=?,
    ~options: Js.Array.t<optionType>,
    ~onChange: Js.Nullable.t<optionType> => unit,
    ~isLoading: bool,
    ~components: {
      "Option": React.component<
        IconOption.props<
          JsxDOM.domRef,
          string,
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
        >,
      >,
      "SingleValue": React.component<
        IconSingleValue.props<
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
          {..},
        >,
      >,
    },
  ) => React.element = "default"
}

@inline
let countriesURL = "/countries.json"

%%raw(`import "/node_modules/flag-icons/css/flag-icons.min.css"`)
%%raw(`import "./CountrySelect.css"`)

@react.component
let make = (~className: option<string>=?, ~country: option<string>, ~onChange: string => unit) => {
  let onReactSelectChange = React.useCallback0((
    selectOpt: Js.Nullable.t<ReactSelect.optionType>,
  ) => {
    switch selectOpt->Js.Nullable.toOption {
    | Some(country) => onChange(country["value"])
    | None => ()
    }
  })

  let (
    countryOptions: Js.Array.t<ReactSelect.optionType>,
    setCountryOptions,
  ) = React.Uncurried.useState(_ => [])
  React.useEffect0(() => {
    let fetcher = async () => {
      try {
        let response = await Fetch.get(countriesURL)
        let data = await Fetch.Response.json(response)
        setCountryOptions(._ => data)
      } catch {
      | _ => ()
      }
    }
    fetcher()->ignore
    None
  })

  let isLoading = countryOptions == []

  let value = Belt.Option.flatMapU(country, (. c) =>
    Js.Array.find(countryOpt => countryOpt["value"] == c, countryOptions)
  )

  <ReactSelect
    ?className
    ?value
    options=countryOptions
    onChange=onReactSelectChange
    isLoading
    components={{"Option": IconOption.make, "SingleValue": IconSingleValue.make}}
  />
}
