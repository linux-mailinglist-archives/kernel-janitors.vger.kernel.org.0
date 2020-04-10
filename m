Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29E671A48FE
	for <lists+kernel-janitors@lfdr.de>; Fri, 10 Apr 2020 19:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgDJRfm (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 10 Apr 2020 13:35:42 -0400
Received: from ciao.gmane.io ([159.69.161.202]:60868 "EHLO ciao.gmane.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726142AbgDJRfm (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 10 Apr 2020 13:35:42 -0400
Received: from list by ciao.gmane.io with local (Exim 4.92)
        (envelope-from <glkj-kernel-janitors-2@m.gmane-mx.org>)
        id 1jMxZ7-00093j-W5
        for kernel-janitors@vger.kernel.org; Fri, 10 Apr 2020 19:35:41 +0200
X-Injected-Via-Gmane: http://gmane.org/
To:     kernel-janitors@vger.kernel.org
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] checkpatch: check for missing \n at the end of logging
 message
Date:   Fri, 10 Apr 2020 19:35:37 +0200
Message-ID: <6e52383e-100d-b016-32c2-6fb54938b6fe@wanadoo.fr>
References: <20200407204908.10420-1-christophe.jaillet@wanadoo.fr>
 <8617a6b94c0644bce1fd4ca77309d67a612e6300.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <8617a6b94c0644bce1fd4ca77309d67a612e6300.camel@perches.com>
Content-Language: en-US
Cc:     linux-kernel@vger.kernel.org
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Le 08/04/2020 à 04:14, Joe Perches a écrit :
> This works rather better:
>
> Perhaps you could test?
> ---
>
> v2:
>
> o Avoid pr_cont
> o Use only last format line if split across multiple lines
>
>   scripts/checkpatch.pl | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index d64c67..f00a6c8 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -5673,6 +5673,28 @@ sub process {
>   			}
>   		}
>   
> +# check for possible missing newlines at the end of common logging functions
> +		if (defined($stat) &&
> +		    $stat =~ /^\+\s*($logFunctions)\s*\((?:\s*$FuncArg\s*,\s*){0,3}\s*$String/ &&
> +		    $1 !~ /_cont$/ && $1 =~ /^(?:pr|dev|netdev|netif|wiphy)_/) {
> +			my $cnt = statement_rawlines($stat);
> +			my $extracted_string = "";
> +			for (my $i = 0; $i < $cnt; $i++) {
> +				next if ($lines[$linenr + $i - 1] !~ /$String\s*[,\)]/);
> +				$extracted_string = get_quoted_string($lines[$linenr + $i - 1],
> +								      $rawlines[$linenr + $i - 1]);
> +				last if ($extracted_string ne "");
> +			}
> +			if ($extracted_string ne "" && $extracted_string !~ /\\n"$/) {
> +				my $herectx = $here . "\n";
> +				for (my $n = 0; $n < $cnt; $n++) {
> +					$herectx .=  raw_line($linenr, $n) . "\n";
> +				}
> +				WARN("MISSING_FORMAT_NEWLINE",
> +				     "Possible missing '\\n' at the end of a logging message format string\n" . $herectx);
> +			}
> +		}
> +
>   # check for logging functions with KERN_<LEVEL>
>   		if ($line !~ /printk(?:_ratelimited|_once)?\s*\(/ &&
>   		    $line =~ /\b$logFunctions\s*\(.*\b(KERN_[A-Z]+)\b/) {


Hi,

I'm looking at some modification done in the last month that could have 
been spotted by the above script.

     ./scripts/checkpatch.pl -f drivers/usb/phy/phy-jz4770.c

correctly spots the 3 first cases, but the 3 last (line 202, 210 and 
217) are missed.
I don't understand why.

CJ


