Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60640316A9
	for <lists+kernel-janitors@lfdr.de>; Fri, 31 May 2019 23:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfEaVeo (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 31 May 2019 17:34:44 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:50900 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfEaVeo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 31 May 2019 17:34:44 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id B6AE715010A2C;
        Fri, 31 May 2019 14:34:43 -0700 (PDT)
Date:   Fri, 31 May 2019 14:34:43 -0700 (PDT)
Message-Id: <20190531.143443.1986779233923573190.davem@davemloft.net>
To:     colin.king@canonical.com
Cc:     kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] nexthop: remove redundant assignment to err
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190530155754.31634-1-colin.king@canonical.com>
References: <20190530155754.31634-1-colin.king@canonical.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Fri, 31 May 2019 14:34:44 -0700 (PDT)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu, 30 May 2019 16:57:54 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is initialized with a value that is never read
> and err is reassigned a few statements later. This initialization
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
