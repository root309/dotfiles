import { BaseConfig } from "https://deno.land/x/ddu_vim@v3.10.3/types.ts";
import type { Denops } from "https://deno.land/x/ddu_vim@v3.10.3/deps.ts";
import { o } from "https://deno.land/x/denops_std@v6.4.0/variable/option.ts";

export class Config extends BaseConfig {
  override async config({ denops }: { denops: Denops }): Promise<void> {
    const columns = await o.get(denops, "columns") as number;

    denops.call('ddu#custom#patch_global', {
      ui: 'ff',
      sources: [
        {
          name: 'file_rec',
          params: {
            ignoredDirectories: ['.git', 'node_modules', 'vendor', '.next']
          }
        }
      ],
      sourceOptions: {
        _: {
          matchers: ['matcher_substring'],
          columns: ['icon_filename'],
        },
      },
      filterParams: {
        matcher_fzf: {
          highlightMatched: 'Search',
        },
      },
      kindOptions: {
        file: {
          defaultAction: 'open',
        },
        buffer: {
          defaultAction: 'open',
        },
        memos: {
          defaultAction: 'open',
        }
      },
      uiParams: {
        ff: {
          startFilter: true,
          prompt: "> ",
          split: "horizontal",
          previewFloating: false,
          previewSplit: "vertical",
          previewFloatingBorder: "none",
          previewWidth: Math.floor(columns * 0.56),  
          previewHeight: Math.floor(columns * 0.12),
          autoAction: {
            name: "preview",
          },
        },
      },
    });

    // Filer specific settings
    denops.call('ddu#custom#patch_local', 'filer', {
      ui: "filer",
      sources: [{
        name: "file",
        params: {},
      }],
      sourceOptions: {
        _: {
          columns: ["icon_filename"],
        },
      },
      kindOptions: {
        file: {
          defaultAction: "open",
        },
      },
      uiParams: {
        filer: {
          // winWidth: 25,
          split: "vertical",
          // splitDirection: "topleft",
          winWidth: 25,
          //split: "floating", 
          splitDirection: "topleft",
          displayTree: true, 
          previewVertical: true, 
          previewWidth: 80, 
        }
      },
    });
  }
}
