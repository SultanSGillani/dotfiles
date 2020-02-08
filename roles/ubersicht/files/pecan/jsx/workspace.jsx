const command = "bash /usr/local/bin/ws";
const refreshFrequency = 1000; // ms

const render = ({ output }) => <div class='screen'><div class='pecanworkspace'>{`${output}`}</div></div>;

export { command, refreshFrequency, render };
