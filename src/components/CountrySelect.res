module ReactSelect = {
  type optionType = {"value": string, "label": string}

  @module("react-select") @react.component
  external make: (
    ~className: string=?,
    ~placeholder: string=?,
    ~value: optionType=?,
    ~options: Js.Array.t<optionType>,
    ~onChange: Js.Nullable.t<optionType> => unit,
    ~isLoading: bool,
    ~autoFocus: bool,
    ~controlShouldRenderValue: bool,
    ~menuIsOpen: bool,
    ~components: {
      "Control": React.component<
        CountrySelect_Control.props<
          JsxDOM.domRef,
          bool,
          bool,
          bool,
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
          React.element,
        >,
      >,
      "DropdownIndicator": React.element,
      "IndicatorSeparator": React.element,
      "Menu": React.component<
        CountrySelect_Menu.props<
          JsxDOM.domRef,
          bool,
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
          React.element,
        >,
      >,
      "Option": React.component<
        CountrySelect_Option.props<
          JsxDOM.domRef,
          string,
          bool,
          bool,
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
let countriesURL = "countries.json"

%%raw(`import "/node_modules/flag-icons/css/flag-icons.min.css"`)
%%raw(`import "./CountrySelect.css"`)

@react.component
let make = (~className: option<string>=?, ~country: option<string>, ~onChange: string => unit) => {
  let (isOpen, setIsOpen) = React.Uncurried.useState(() => false)

  let onReactSelectChange = React.useCallback0((
    selectOpt: Js.Nullable.t<ReactSelect.optionType>,
  ) => {
    setIsOpen(._ => false)
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

  <div className={"countryselect " ++ className->Belt.Option.getWithDefault("")}>
    <CountrySelect_DropDown
      isOpen
      target={<button
        className="countryselect--button" onClick={_ => setIsOpen(.previous => !previous)}>
        {<>
          {value->Belt.Option.mapWithDefaultU(
            <span className="countryselect--button--novalue"> {React.string("Select")} </span>,
            (. country) => <>
              <span className={"fi fi-" ++ country["value"]} />
              <span> {React.string(country["label"])} </span>
            </>,
          )}
          <div className="countryselect--button--arrow" />
        </>}
      </button>}
      onClose={() => setIsOpen(._ => false)}>
      <ReactSelect
        className="countryselect--select"
        ?value
        options=countryOptions
        onChange=onReactSelectChange
        isLoading
        placeholder="Search"
        autoFocus=true
        controlShouldRenderValue=false
        menuIsOpen=true
        components={{
          "Control": CountrySelect_Control.make,
          "DropdownIndicator": React.null,
          "IndicatorSeparator": React.null,
          "Menu": CountrySelect_Menu.make,
          "Option": CountrySelect_Option.make,
        }}
      />
    </CountrySelect_DropDown>
  </div>
}
