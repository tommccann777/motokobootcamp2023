1. The controller id for the ledger canister is r7inp-6aaaa-aaaaa-aaabq-cai
2. Subnet pae4o-o6dxf-xki7q-ezclx-znyd6-fnk6w-vkv5z-5lfwh-xym2i-otrrw-fqe which has 16 nodes
3. 12.5 votes
4. The code requires an import, specifically: import Nat "mo:base/Nat";
5. (a) The languages array should be declared as [Text] instead of [var Text],
   (b) The function should be declared as returning [Text],
   (c) The parameter for show_languages has no effect and should be removed
   (d) show_languages could be declared as a query function for better performance
6. (a) It requires an import, specifically: import Array "mo:base/Array";
   (b) Array.append has been deprecated due to the poor performance of having re-create the array when a new element is added
