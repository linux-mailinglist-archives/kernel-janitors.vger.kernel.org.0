Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA7123D3B47
	for <lists+kernel-janitors@lfdr.de>; Fri, 23 Jul 2021 15:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233535AbhGWM5m (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 23 Jul 2021 08:57:42 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:53892
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233365AbhGWM5l (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 23 Jul 2021 08:57:41 -0400
Received: from [10.172.193.212] (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 8A6733F328;
        Fri, 23 Jul 2021 13:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627047494;
        bh=u2lLmfuwa+J8WjD4hLlJA/Xq6x7uOseXDOQ/Q4M24Cc=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=RIo4tXdCqD/g+GV1RuRBuHGhwEX3eD7eHoB8EtRJ3NdBtObuaBrfom+kXdOqjqmw2
         ho0jlXp2trzQQW7lhOdN38j6y5yW6YlVgGN+PVCvBkenCkN4tUjem+92ihFCGKmYlU
         zMxhB9L2lrYTWIiQ/NGyUPbUXe6tmlf8IAFc/Q+yS0jI3hoMx9stRYZOXzX5x+qOl5
         Fzk3dDkSf/WBbB12nXz7pbHxHE5JjrOO63YovfOge3Gaqt8zwUdwz5MMdZVTd/TRId
         2y9kXsdAveXnlFzb9QQdn++fY2yREYgXcEZEQ7w8mnpTJi6Z7oFMxwzB/p7/ivBIMl
         JAYMHZwZeo+JQ==
Subject: Re: [bug report] octeontx2-af: Introduce internal packet switching
To:     Dan Carpenter <dan.carpenter@oracle.com>, sbhatta@marvell.com
Cc:     kernel-janitors@vger.kernel.org
References: <20210723133633.GA18413@kili>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <dfc6a8c8-e2a6-bcd3-6d16-81a888e8fd98@canonical.com>
Date:   Fri, 23 Jul 2021 14:38:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210723133633.GA18413@kili>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 23/07/2021 14:36, Dan Carpenter wrote:
> Hello Subbaraya Sundeep,
> 
> The patch 23109f8dd06d: "octeontx2-af: Introduce internal packet
> switching" from Jul 19, 2021, leads to the following static checker
> warning:
> 
> 	drivers/net/ethernet/marvell/octeontx2/af/rvu_switch.c:220 rvu_switch_disable()
> 	error: uninitialized symbol 'numvfs'.
> 
> drivers/net/ethernet/marvell/octeontx2/af/rvu_switch.c
>     195 void rvu_switch_disable(struct rvu *rvu)
>     196 {
>     197 	struct npc_delete_flow_req uninstall_req = { 0 };
>     198 	struct npc_mcam_free_entry_req free_req = { 0 };
>     199 	struct rvu_switch *rswitch = &rvu->rswitch;
>     200 	struct rvu_hwinfo *hw = rvu->hw;
>     201 	int pf, vf, numvfs, hwvf;
>                             ^^^^^^
>     202 	struct msg_rsp rsp;
>     203 	u16 pcifunc;
>     204 	int err;
>     205 
>     206 	if (!rswitch->used_entries)
>     207 		return;
>     208 
>     209 	for (pf = 1; pf < hw->total_pfs; pf++) {
>     210 		if (!is_pf_cgxmapped(rvu, pf))
>     211 			continue;
>     212 
>     213 		pcifunc = pf << 10;
>     214 		err = rvu_switch_install_rx_rule(rvu, pcifunc, 0xFFF);
>     215 		if (err)
>     216 			dev_err(rvu->dev,
>     217 				"Reverting RX rule for PF%d failed(%d)\n",
>     218 				pf, err);
>     219 
> --> 220 		for (vf = 0; vf < numvfs; vf++, hwvf++) {
>                                           ^^^^^^
> Never initialized.

And hwvf too.

> 
>     221 			pcifunc = pf << 10 | ((vf + 1) & 0x3FF);
>     222 			err = rvu_switch_install_rx_rule(rvu, pcifunc, 0xFFF);
>     223 			if (err)
>     224 				dev_err(rvu->dev,
>     225 					"Reverting RX rule for PF%dVF%d failed(%d)\n",
>     226 					pf, vf, err);
>     227 		}
>     228 	}
>     229 
>     230 	uninstall_req.start = rswitch->start_entry;
>     231 	uninstall_req.end =  rswitch->start_entry + rswitch->used_entries - 1;
>     232 	free_req.all = 1;
>     233 	rvu_mbox_handler_npc_delete_flow(rvu, &uninstall_req, &rsp);
>     234 	rvu_mbox_handler_npc_mcam_free_entry(rvu, &free_req, &rsp);
>     235 	rswitch->used_entries = 0;
>     236 	kfree(rswitch->entry2pcifunc);
>     237 }
> 
> regards,
> dan carpenter
> 

