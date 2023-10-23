Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 530F07D3F8A
	for <lists+kernel-janitors@lfdr.de>; Mon, 23 Oct 2023 20:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233449AbjJWSt4 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 23 Oct 2023 14:49:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233387AbjJWStx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Oct 2023 14:49:53 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2DD7D78
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 11:49:51 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0D9C433CC;
        Mon, 23 Oct 2023 18:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1698086991;
        bh=m+WlsyLq5l1Kq4y/rSEj4WsaDxO+2meb6Bp7ach1P2o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=08iJPnxihDePlRvjA//xTPdu+vZrhzsIrEZReQhg9CuciLY5QDQyTEyPEYh7wLLCR
         rRjALXNupBFb80HLEaVq/RbTrg1MrHVpabdbmfCDXOQn9NjbRgpAVakbGBB73+kJ0d
         /bU9CBXtF+ssadrumQEWyPtGtB0QgZiU1fCUNFok=
Date:   Mon, 23 Oct 2023 11:49:49 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-Id: <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
In-Reply-To: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 19 Oct 2023 07:11:36 +0300 Dan Carpenter <dan.carpenter@linaro.org> wrote:

> Yesterday someone on my lists just sent an email looking for kernel
> tasks. 

Well here's a task: write a bot which follows the mailing lists and
sends people nastygrams if one of their emails is more than 95%(?)
quoted text.

It's happening significantly more lately.  Possibly because the gmail
client helpfully hides quoted text.

Probably not a great way of becoming popular.
