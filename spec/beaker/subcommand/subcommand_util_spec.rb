require 'spec_helper'

module Beaker
  module Subcommands
    describe SubcommandUtil do

      let(:cli) {
        double("cli")
      }

      let(:rake) {
        double("rake")
      }

      let(:file) {
        double("file")
      }

      let(:store) {
        double("store")
      }

      let(:host) {
        double("host")
      }

      let(:hypervisors) {
        double("hypervisors")
      }

      let(:hosts) {
        double("hosts")
      }

      let(:hypervisors_object) {
        double("hypervisors_object")
      }

      let(:hosts_object) {
        double("hosts_object")
      }

      let(:network_manager){
        double("network_manager")
      }

      let(:save_object){
        double("save_object")
      }

      let(:load_object){
        double("load_object")
      }

      let(:yaml_object){
        double("yaml_object")
      }

      describe 'execute_subcommand' do
        it "determines if we should execute the init subcommand" do
          expect(subject.execute_subcommand?("init")).to be == true
        end
        it "does not attempt to execute intialize as a subcommand" do
          expect(subject.execute_subcommand?("initialize")).to be == false
        end
        it "determines if we should execute the help subcommand" do
          expect(subject.execute_subcommand?("help")).to be == true
        end
        it "determines if we should execute the provision subcommand" do
          expect(subject.execute_subcommand?("provision")).to be == true
        end
        it "determines that a subcommand should not be executed" do
          expect(subject.execute_subcommand?("notasubcommand")).to be == false
        end
      end


      describe 'error_with' do
        it "the exit value should default to 1" do
          expect(STDOUT).to receive(:puts).with("exiting").exactly(1).times
          begin
            subject.error_with("exiting")
          rescue SystemExit=>e
            expect(e.status).to eq(1)
          end
        end
        it "the exit value should return specified value" do
          expect(STDOUT).to receive(:puts).with("exiting").exactly(1).times
          begin
            subject.error_with("exiting", {exit_code: 3})
          rescue SystemExit=>e
            expect(e.status).to eq(3)
          end
        end

        it "the exit value should default to 1 with a stack trace" do
          expect(STDOUT).to receive(:puts).with("exiting").exactly(1).times
          expect(STDOUT).to receive(:puts).with("testing").exactly(1).times
          begin
            subject.error_with("exiting", {stack_trace: "testing"})
          rescue SystemExit=>e
            expect(e.status).to eq(1)
          end
        end
      end

    end
  end
end
