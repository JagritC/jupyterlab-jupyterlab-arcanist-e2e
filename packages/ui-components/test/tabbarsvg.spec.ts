// Copyright (c) Jupyter Development Team.
// Distributed under the terms of the Modified BSD License.

import { DockPanelSvg, TabBarSvg } from '@jupyterlab/ui-components';
import { Title, Widget } from '@lumino/widgets';
import { VirtualDOM } from '@lumino/virtualdom';

describe('.Renderer', () => {
  let title: Title<Widget>;

  beforeEach(() => {
    let owner = new Widget();
    title = new Title({
      owner,
      label: 'foo',
      closable: true,
      iconClass: 'bar',
      className: 'fizz',
      caption: 'this is a caption'
    });
  });

  describe('#renderCloseIcon()', () => {
    it('should render the close icon and check the title element matches the title', () => {
      let renderer = new TabBarSvg.Renderer();
      let vNode = renderer.renderCloseIcon({
        title,
        current: true,
        zIndex: 1
      });
      let icon = VirtualDOM.realize(vNode);
      expect(icon.className).toContain('lm-TabBar-tabCloseIcon');
      expect(icon.title).toEqual('Close ' + title.label);
    });
  });
});

describe('.DockPanelSvg.Renderer', () => {
  describe('#createTabBar()', () => {
    it('should create a dock panel tab bar with tiny scrollbar styling', () => {
      const renderer = new DockPanelSvg.Renderer();
      const bar = renderer.createTabBar();

      expect(bar.hasClass('lm-DockPanel-tabBar')).toBe(true);
      expect(bar.hasClass('jp-scrollbar-tiny')).toBe(true);
    });
  });
});
