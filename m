Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A07D48908A
	for <lists+kernel-janitors@lfdr.de>; Mon, 10 Jan 2022 08:11:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239153AbiAJHLt (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 10 Jan 2022 02:11:49 -0500
Received: from verein.lst.de ([213.95.11.211]:37044 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230433AbiAJHLr (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 Jan 2022 02:11:47 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 4133B68AFE; Mon, 10 Jan 2022 08:11:44 +0100 (CET)
Date:   Mon, 10 Jan 2022 08:11:44 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
        Alexander Lobakin <alexandr.lobakin@intel.com>,
        intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org
Subject: Re: [PATCH] ixgb: Remove useless DMA-32 fallback configuration
Message-ID: <20220110071144.GB625@lst.de>
References: <a56f72c090866c11a0c091e561dbfc69d826cd0e.1641748751.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a56f72c090866c11a0c091e561dbfc69d826cd0e.1641748751.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
