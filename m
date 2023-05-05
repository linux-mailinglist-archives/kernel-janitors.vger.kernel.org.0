Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14F136F8373
	for <lists+kernel-janitors@lfdr.de>; Fri,  5 May 2023 15:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232307AbjEENGy (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 5 May 2023 09:06:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbjEENGw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 May 2023 09:06:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B05A83A84;
        Fri,  5 May 2023 06:06:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 48A7463DE3;
        Fri,  5 May 2023 13:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E1CC4339B;
        Fri,  5 May 2023 13:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683292010;
        bh=pTi9hgjtIKX3NwObZUFs81T3q3enyeNeTCEnzZ4nioM=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=P0vlDSVZxfrK8JJ3M0hnyg59yongnYzs1xV61CEaNMRBiPPWaUkw1hdwpv+24URhL
         CK/e5oHBXIAfaHnuY8K2N77Pue1nupGgyHK0jQLdc7NWwXMl6v2dEgMISDNdAr2MUi
         np2umZbtSTbDKa/kAUkiqH4DZJhefdeXZUu8zA26D/O5br7dVosDsQW0NB1np8nVDo
         ZQeV08cV6OvCX1nfQtUBV8P2uaJTrQVkCj57mqhGajX7WRSBciSnUxlw05gZlKOIug
         3Ts1SAqz7LLeJ22VVMlm/eXv+zXvzio4hQ4VCtfsaEUZ1Jjt0FdeIBgqWQDdy9zhOL
         pvbBD8UDQ/zzw==
From:   Kalle Valo <kvalo@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] wifi: ath11k: Use list_count_nodes()
References: <941484caae24b89d20524b1a5661dd1fd7025492.1682542084.git.christophe.jaillet@wanadoo.fr>
Date:   Fri, 05 May 2023 16:06:46 +0300
In-Reply-To: <941484caae24b89d20524b1a5661dd1fd7025492.1682542084.git.christophe.jaillet@wanadoo.fr>
        (Christophe JAILLET's message of "Wed, 26 Apr 2023 22:48:59 +0200")
Message-ID: <877ctnorkp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:

> ath11k_wmi_fw_stats_num_vdevs() and ath11k_wmi_fw_stats_num_bcn() really
> look the same as list_count_nodes(), so use the latter instead of hand
> writing it.
>
> The first ones use list_for_each_entry() and the other list_for_each(), but
> they both count the number of nodes in the list.
>
> While at it, also remove to prototypes of non-existent functions.
> Based on the names and prototypes, it is likely that they should be
> equivalent to list_count_nodes().
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Un-tested

BTW I prefer to have "Compile tested only" in the commit log to make it
clear that it's not tested on a real device. So I added that sentence to
both this and ath10k patch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
