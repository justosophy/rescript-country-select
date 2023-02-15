@react.component
let make = () => {
  let (country, setCountry) = React.Uncurried.useState(_ => Some("us"))
  <>
    <div>
      <h3> {React.string("Dynamic value")} </h3>
      <CountrySelect className="custom-class" country onChange={c => setCountry(._ => Some(c))} />
    </div>
    <div>
      <h3> {React.string("Fixed value (console log)")} </h3>
      <CountrySelect
        className="custom-class" country=Some("us") onChange={country => Js.log(country)}
      />
    </div>
  </>
}
