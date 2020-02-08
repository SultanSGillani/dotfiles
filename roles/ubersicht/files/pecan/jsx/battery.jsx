const command = "bash /usr/local/bin/battery";
const refreshFrequency = 60000; // ms

const render = ({ output }) => <div class='screen'><div class='pecanbattery'>{`${output}`}</div></div>;

export { command, refreshFrequency, render };
