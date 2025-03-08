const resource = GetParentResourceName();

async function fetchNui(eventName, data) {
  const resp = await fetch(`https://${resource}/${eventName}`, {
    method: "post",
    headers: {
      "Content-Type": "application/json; charset=UTF-8",
    },
    body: JSON.stringify(data),
  });
  return await resp.json();
}

// CreateOption Component
const CreateOption = ({ data, mainColor, onSelect }) => {
  return (
    <div
      className="option-container"
      onClick={onSelect}
      style={{
        borderColor: `${mainColor}`,
      }}
    >
      <i
        class={`fa-fw ${data.icon} option-icon`}
        style={{
          color: `${mainColor}`,
        }}
      ></i>
      <p className="option-label">{data.label}</p>
    </div>
  );
};

// Main Application Component
const App = () => {
  const [isVisible, setIsVisible] = React.useState(false);
  const [eyeHover, setEyeHover] = React.useState(false);
  const [options, setOptions] = React.useState([]);
  const [mainColor, setMainColor] = React.useState("#0051ff");
  const [parentGroups, setParentGroups] = React.useState([]);
  const [selectedGroup, setSelectedGroup] = React.useState(null);

  const handleMessage = (event) => {
    setOptions([]);

    switch (event.data.event) {
      case "visible": {
        setIsVisible(event.data.state);
        setEyeHover(false);
        setSelectedGroup(null);
        setParentGroups([]);
        break;
      }
      case "leftTarget": {
        setEyeHover(false);
        setSelectedGroup(null);
        setParentGroups([]);
        break;
      }
      case "setTarget": {
        setEyeHover(true);

        if (event.data.options) {
          const newOptions = [];
          const parentGroups = [];

          for (const type in event.data.options) {
            event.data.options[type].forEach((data, id) => {
              newOptions.push({ type, data, id: id + 1 });
              if (
                data.parentGroup &&
                !data.hide &&
                !parentGroups.includes(data.parentGroup)
              ) {
                parentGroups.push(data.parentGroup);
              }
            });
          }
          setOptions(newOptions);
          setParentGroups(parentGroups);
          if (!!selectedGroup && !parentGroups.includes(selectedGroup)) {
            setSelectedGroup(null);
          }
        }
        break;
      }
      default:
        break;
    }
  };

  React.useEffect(() => {
    window.addEventListener("message", handleMessage);

    (async () => {
      const response = await fetchNui("getServerName");
      if (response == "FBA") {
        setMainColor("#0051ff");
      } else if (response == "FLA") {
        setMainColor("#0051ff");
      } else {
        setMainColor("#0051ff");
      }
    })();

    return () => {
      window.removeEventListener("message", handleMessage);
    };
  }, []);

  if (!isVisible) return <React.Fragment></React.Fragment>;

  return (
    <div id="app">
      <div id="eye">
        <svg
          id="eyeSvg"
          xmlns="http://www.w3.org/2000/svg"
          height="2.8vh"
          viewBox="0 0 24 24"
          width="2.8vh"
          fill={eyeHover ? mainColor : "#000000"}
        >
          <path d="M0 0h24v24H0V0z" fill="none" />
          <path d="M12 4C7 4 2.73 7.11 1 11.5 2.73 15.89 7 19 12 19s9.27-3.11 11-7.5C21.27 7.11 17 4 12 4zm0 12.5c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z" />
        </svg>
      </div>
      <div id="options-wrapper">
        {selectedGroup ? (
          <CreateOption
            data={{ label: "Retour", icon: "fa-solid fa-chevrons-left" }}
            onSelect={() => setSelectedGroup(null)}
            mainColor={mainColor}
            key={"back"}
          />
        ) : (
          parentGroups.map((group) => (
            <CreateOption
              data={{ label: group, icon: "fa-solid fa-chevrons-right" }}
              onSelect={() => setSelectedGroup(group)}
              mainColor={mainColor}
              key={group}
            />
          ))
        )}
        {options
          .filter(
            (option) =>
              !option.data.hide && option.data.parentGroup == selectedGroup
          )
          .map((option) => {
            const { type, id } = option;
            const onSelect = () => fetchNui("select", [type, id]);
            return (
              <CreateOption
                {...option}
                onSelect={onSelect}
                mainColor={mainColor}
                key={`${option.type}-${option.id}`}
              />
            );
          })}
      </div>
    </div>
  );
};

// Render the component to the DOM
const container = document.getElementById("root");
const root = ReactDOM.createRoot(container);
root.render(<App />);
