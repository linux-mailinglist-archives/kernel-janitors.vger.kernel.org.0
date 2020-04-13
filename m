Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 001311A61E6
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Apr 2020 06:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727456AbgDMEVD (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 13 Apr 2020 00:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:58794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbgDMEVC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 13 Apr 2020 00:21:02 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F30C008681
        for <kernel-janitors@vger.kernel.org>; Sun, 12 Apr 2020 21:21:03 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id A011D127AFC12;
        Sun, 12 Apr 2020 21:21:02 -0700 (PDT)
Date:   Sun, 12 Apr 2020 21:21:01 -0700 (PDT)
Message-Id: <20200412.212101.1714447481929250845.davem@davemloft.net>
To:     christophe.jaillet@wanadoo.fr
Cc:     thomas.petazzoni@bootlin.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] net: mvneta: Fix a typo
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200412212034.4532-1-christophe.jaillet@wanadoo.fr>
References: <20200412212034.4532-1-christophe.jaillet@wanadoo.fr>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sun, 12 Apr 2020 21:21:02 -0700 (PDT)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 12 Apr 2020 23:20:34 +0200

> s/mvmeta/mvneta/
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, but please reply to Jakub's feedback explaining how you
found this.

Thank you.
